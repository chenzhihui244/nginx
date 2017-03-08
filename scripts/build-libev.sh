#!/bin/sh

LIBEV=
LIBEV_DIR=libev
LIBEV_URL=https://github.com/enki/libev.git

TOPDIR=`pwd`

libev_is_install()
{
	test -d $TOPDIR/$LIBEV_DIR
}

mkdir -p build

if [ ! -d build ]; then
	git clone $LIBEV_URL build/$LIBEV_DIR
fi

mkdir -p lib
pushd build/$LIBEV_DIR
./configure --prefix=$TOPDIR/lib
make && make install
popd
