#/bin/sh
TARGET_DIR=$1
PUBLIC_DIR=public

git fetch
git pull

git submodule update --remote --merge

#build and deploy - root
cd root_hugosite
rm -r ${PUBLIC_DIR}
hugo

cp -r ${PUBLIC_DIR}/* ${TARGET_DIR}/root

#build and deploy - craft
cd ../craft_hugosite
rm -r ${PUBLIC_DIR}
hugo

cp -r ${PUBLIC_DIR}/* ${TARGET_DIR}/craft
