#!/bin/bash

# Starting php
echo "*** Starting php"
service php7.3-fpm start
#mkdir /run/php/
#/usr/sbin/php-fpm7.3 &

echo "*** Starting mysql"

service mysql start

envsubst < ft_server > /etc/nginx/sites-available/ft_server
rm ft_server

# Start nginx
echo "*** Starting nginx"
nginx -g 'daemon off;'
#service nginx start
#cat 
#sleep infinity
