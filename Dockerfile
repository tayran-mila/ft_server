FROM	debian:buster

RUN 	apt update && \
	apt install -y \
	mariadb-server \
	gettext-base \
	php-mysql \
	php-fpm \
	nginx

ENV 	AUTO_IDX on

ADD	srcs/phpmyadmin.tar.gz /var/www/html/
ADD	srcs/wordpress.tar.gz /var/www/html/

COPY	srcs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY	srcs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY	srcs/wp-config.php /var/www/html/wordpress/
COPY	srcs/wordpress.sql .
COPY	srcs/ft_server .
COPY	srcs/mysql.sh .
COPY	srcs/start.sh .

RUN	ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ && \
	unlink /etc/nginx/sites-enabled/default && \
	chmod +x mysql.sh start.sh && \
	./mysql.sh

ENTRYPOINT ["./start.sh"]

