#!/bin/bash

service mysql start 
mysql -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '12345';"
#Create wordpress database
mysql -e "CREATE DATABASE wordpress"
#Add permisions to wordpress user
mysql -e "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost';"

mysql -e "SOURCE /wordpress.sql;"
rm /wordpress.sql
