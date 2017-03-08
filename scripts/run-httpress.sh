#!/bin/sh

source scripts/profile

requests=200000
threads=64
connections=100
url=https://localhost/index.html
#url=http://localhost/index.html

httpress -n $requests -c $connections -t $threads $url
#httpress -n 200000 -c 100 -t 64 -k https://192.168.1.188/index.html
