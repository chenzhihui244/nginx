
#!/bin/sh

source scripts/profile

ulimit -n 102400

target=${1-"localhost"}

threads=64
(( connections=threads*16 ))
(( requests=connections*4000 ))

url=https://${target}/index.html

httpress -n $requests -c $connections -t $threads $url
#httpress -n 200000 -c 100 -t 64 -k https://192.168.1.188/index.html
