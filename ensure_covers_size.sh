#/bin/sh

# brew install imagemagick
find root_hugosite/static/covers -type f -exec convert {} -resize 250x250\> {} \;
