#/bin/sh
TARGET_DIR=$1
PUBLIC_DIR=public

#build
cd craft_hugosite
rm -r ${PUBLIC_DIR}
hugo

cp -r ${PUBLIC_DIR}/* ${TARGET_DIR}/craft
