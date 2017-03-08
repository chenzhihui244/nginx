#!/bin/sh

NGINX=nginx-1.11.4.tar.gz
NGINX_DIR=${NGINX%\.*}
NGINX_DIR=${NGINX_DIR%\.*}
NGINX_URL=http://nginx.org/download/nginx-1.11.4.tar.gz
NGINX_PATH=$TOPDIR/install/ngix

TOPDIR=`pwd`

nginx_is_install()
{
	test -d $TOPDIR/install/nginx
}

mkdir -p build
mkdir -p install

if [ ! -d $TOPDIR/build/$NGINX_DIR ]; then
	wget $NGINX_URL -O pkg/$NGINX
	tar xf pkg/$NGINX -C build
fi

if $(which apt-get >/dev/null 2>&1); then
	apt-get install -y build-essential
	apt-get install -y libpcre++-dev
	apt-get install -y libssl-dev
fi

pushd build/$NGINX_DIR
./configure  --with-http_ssl_module --prefix=$TOPDIR/install
make && make install
popd

if nginx_is_install; then
	echo "export NGINX_PATH=$NGINX_PATH" >> scripts/profile
	echo 'export PATH=$PATH:$NGINX_PATH/sbin' >> scripts/profile
	echo "$NGINX install successfully"
	exit 0
else
	echo "Failed to $NGINX"
	exit 1
fi

