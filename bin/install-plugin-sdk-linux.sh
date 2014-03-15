#!/bin/bash

# Version 4.2.18
DOWNLOAD_URL="https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz/version/42180"
# old url: https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz
# To find new URLs, see: https://marketplace.atlassian.com/plugins/atlassian-plugin-sdk-tgz/versions

INSTALL_BIN=`pwd`/.sdk.tar.gz
INSTALL_DIR=`pwd`/.sdk
TMP_DIR=`pwd`/.tmp

if [[ `uname` -ne "Linux" ]]; then
    echo "ERROR: this script currently only supports linux" && exit 1
fi

if [[ ! -f $INSTALL_BIN ]]; then
    # download plugin sdk
    echo "Downloading SDK"
    wget -O$INSTALL_BIN $DOWNLOAD_URL || exit 1;
fi

if [[ ! -d $INSTALL_DIR ]]; then
    mkdir $TMP_DIR && cd $TMP_DIR && tar -xzf $INSTALL_BIN
    SDK_DIR=`ls -d atlassian-plugin-sdk-*`
    mv $SDK_DIR $INSTALL_DIR
    cd .. && rm -rf $TMP_DIR
fi

exit 0
