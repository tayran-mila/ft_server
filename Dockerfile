FROM debian:buster

RUN 	apt update && \
	apt install -y \
	nginx \
	php-fpm \
	php-mysql \
	mariadb-server \
	gettext-base 

ADD srcs/phpmyadmin.tar.gz /var/www/html/
ADD srcs/wordpress.tar.gz /var/www/html/

RUN unlink /etc/nginx/sites-enabled/default

COPY srcs/ft_server .
COPY srcs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY srcs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt

RUN ln -s /etc/nginx/sites-available/ft_server  /etc/nginx/sites-enabled/

COPY srcs/test.php /var/www/html/
COPY srcs/start.sh .

COPY srcs/mysql.sh .
COPY srcs/wp-config.php /var/www/html/wordpress/
COPY srcs/wordpress.sql .

RUN chmod +x start.sh mysql.sh

RUN ./mysql.sh

ENV AUTO_IDX on

ENTRYPOINT ["./start.sh"]

