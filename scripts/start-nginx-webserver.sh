
#!/bin/sh

TOPDIR=`pwd`

source scripts/profile

setup_webserver()
{
	#cp conf/nginx/nginx.conf.webserver $NGINX_PATH/conf/nginx.conf
}

setup_webserver

# start nginx
$NGINX_PATH/sbin/nginx -s stop
sleep 1
$NGINX_PATH/sbin/nginx -c conf/nginx/nginx.conf.webserver
sleep 1
ps -ef | grep nginx | grep -v grep | grep -v "start-nginx" | wc -l

# stop nginx
#$NGINX_PATH/sbin/nginx -s stop

# reload nginx
#$NGINX_PATH/sbin/nginx -s reload
