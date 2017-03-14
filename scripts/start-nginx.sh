#!/bin/sh

TOPDIR=`pwd`

source scripts/profile

cp conf/nginx/nginx.conf $NGINX_PATH/conf/nginx.conf
mkdir -p $NGINX_PATH/conf/conf.d
mv conf/nginx/nginx.conf.webserver $NGINX_PATH/conf/conf.d/server.conf

# start nginx
$NGINX_PATH/sbin/nginx -s stop
$NGINX_PATH/sbin/nginx

sleep 10

ps -ef | grep nginx | grep -v grep | grep -v "start-nginx" | wc -l

# stop nginx
#$NGINX_PATH/sbin/nginx -s stop

# reload nginx
#$NGINX_PATH/sbin/nginx -s reload
