#!/bin/sh

TOPDIR=`pwd`

source scripts/profile

cp conf/nginx.conf.webserver $NGINX_PATH/conf/nginx.conf

# start nginx
$NGINX_PATH/sbin/nginx

sleep 10

ps -ef | grep nginx | grep -v grep | grep -v "start-nginx" | wc -l

# stop nginx
#$NGINX_PATH/sbin/nginx -s stop

# reload nginx
#$NGINX_PATH/sbin/nginx -s reload
