#!/bin/sh

HTTPRESS=f27fa1949044.zip
HTTPRESS_DIR=yarosla-httpress-f27fa1949044
HTTPRESS_URL=https://bitbucket.org/yarosla/httpress/get/f27fa1949044.zip

TOPDIR=`pwd`

mkdir -p pkg

pushd build/$HTTPRESS_DIR
make
popd


#./httpress -n 200000 -c 100 -t 64 https://192.168.1.188/index.html

