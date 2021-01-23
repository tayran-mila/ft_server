#!/bin/bash

# Starting php
echo "*** Starting php"
service php7.3-fpm start
#mkdir /run/php/
#/usr/sbin/php-fpm7.3 &

echo "*** Starting mysql"

service mysql start



# Start nginx
echo "*** Starting nginx"
nginx -g 'daemon off;'
#service nginx start
#cat 
#sleep infinity
