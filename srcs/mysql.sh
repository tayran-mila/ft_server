#!/bin/bash

# Starts mysql service
service mysql start

#Creates user at localhost
mysql -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '12345';"

#Create wordpress database
mysql -e "CREATE DATABASE wordpress"

#Add permisions to wordpress user
mysql -e "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost';"

# Fills the db based on an existing db
mysql -e "SOURCE /wordpress.sql;"

# Removes de file
rm /wordpress.sql
