#!/bin/bash

# Starting php
echo "*** Starting php"
service php7.3-fpm start

# Starting mysql
echo "*** Starting mysql"
service mysql start

# Using environment variable to chang status of autoindex
envsubst '$AUTO_IDX' < ft_server > /etc/nginx/sites-available/ft_server
rm ft_server

# Start nginx
echo "*** Starting nginx"
nginx -g 'daemon off;'
