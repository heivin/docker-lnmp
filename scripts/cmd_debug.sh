#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"

docker run -t -i \
	-p 80:80 \
	-p 3306:3306 \
	--volumes-from mysql_data \
	-v "$DIR"/../etc/nginx/nginx.conf:/etc/nginx/nginx.conf \
	-v "$DIR"/../etc/nginx/hosts/:/etc/nginx/hosts/ \
	-v "$DIR"/../etc/php-fpm.conf:/etc/php-fpm.conf \
	-v "$DIR"/../etc/php-fpm.d/:/etc/php-fpm.d/ \
	-v "$DIR"/../etc/php.ini:/etc/php.ini \
	-v "$DIR"/../etc/my.cnf:/etc/my.cnf \
	-v "$DIR"/../www:/home/dev/www \
	-v "$DIR"/../etc/postfix/main.cf:/etc/postfix/main.cf \
	-v "$DIR"/../logs:/home/dev/logs \
	vukor/docker-lnmp /bin/bash
