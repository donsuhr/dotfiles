#!/bin/zsh

# ~/dotfiles/bumpgato.sh ~/dev/pmec

export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

VERSION_STRING='"version": '
CURR_VERSION=$(awk -F \" '/"version": ".+"/ { print $4; exit; }' package.json)
NEXT_VERSION=$(echo ${CURR_VERSION} | awk -F. -v OFS=. '{$NF += 1 ; print}')
PACKAGE_NAME=$(awk -F \" '/"name": ".+"/ { print $4; exit; }' package.json)
BUNDLE_PREFIX=$(echo ${PACKAGE_NAME} | sed -e "s/@//g" | sed -e "s/\//-/g")
CWD=$(pwd)
TARGET_DIR=$1

# bump package verison so it doesnt cache the bundle
sed -i '' "s/\($VERSION_STRING\).*/\1\"$NEXT_VERSION\",/" package.json

echo "CWD: $CWD"
echo "NEXT_VERSION: $NEXT_VERSION"
echo "BUNDLE_PREFIX: $BUNDLE_PREFIX" 
echo "TARGET_DIR: $TARGET_DIR" 

nvm use
yarn
npm run build
npm pack

cd $TARGET_DIR
echo "PWD: $PWD"
nvm use
yarn add $CWD/$BUNDLE_PREFIX-${NEXT_VERSION}.tgz
# ./bump.sh

cd $CWD
nvm use

echo '\a'
