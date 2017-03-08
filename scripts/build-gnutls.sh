#!/bin/sh

TOPDIR=`pwd`

GNU_TLS=gnutls-3.3.24.tar.xz
GNU_TLS_DIR=${GNU_TLS%\.*}
GNU_TLS_DIR=${GNU_TLS_DIR%\.*}
GNU_TLS_URL=https://www.gnupg.org/ftp/gcrypt/gnutls/v3.3/gnutls-3.3.24.tar.xz

gnutls_is_install()
{
	return 0
}

if $(which apt-get >/dev/null 2>&1); then
	apt-get install nettle-dev
fi

if $(which yum >/dev/null 2>&1); then
	yum install nettle-devel -y
fi

mkdir -p pkg
mkdir -p build

if [ ! -f pkg/$GNU_TLS ]; then
	wget GNU_TLS_URL -O pkg/$GNU_TLS
fi

tar xf pkg/$GNU_TLS -C build

pushd build/$GNU_TLS_DIR
./configure --disable-non-suiteb-curves
make && make install
popd
