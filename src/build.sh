#! /bin/bash

NPM_DIR=`npm bin`/

# Cleanup folder
rm -rf _assets

# Recreate folder
mkdir -p _assets/website/
mkdir -p _assets/ebook/

# Compile JS
# ${NPM_DIR}browserify src/js/core/index.js | ${NPM_DIR}uglifyjs -mc > _assets/website/gitbook.js
# ${NPM_DIR}browserify src/js/theme/index.js | ${NPM_DIR}uglifyjs -mc > _assets/website/theme.js

${NPM_DIR}browserify src/js/core/index.js > _assets/website/gitbook.js
${NPM_DIR}browserify src/js/theme/index.js > _assets/website/theme.js

# Compile Website CSS
lessc -clean-css src/less/website.less _assets/website/style.css

# Compile eBook CSS
lessc -clean-css src/less/ebook.less _assets/ebook/ebook.css
lessc -clean-css src/less/pdf.less _assets/ebook/pdf.css
lessc -clean-css src/less/mobi.less _assets/ebook/mobi.css
lessc -clean-css src/less/epub.less _assets/ebook/epub.css

# Copy fonts
mkdir -p _assets/website/fonts
cp -R node_modules/font-awesome/fonts/ _assets/website/fonts/fontawesome/

# Copy icons
mkdir -p _assets/website/images
cp node_modules/gitbook-logos/output/favicon.ico _assets/website/images/
cp node_modules/gitbook-logos/output/apple-touch-icon-152.png _assets/website/images/apple-touch-icon-precomposed-152.png