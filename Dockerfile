FROM richarvey/nginx-php-fpm:2.0.1
RUN apk add -U --no-cache nghttp2-dev nodejs npm unzip mariadb-dev mariadb sqlite sqlite-dev
COPY . .


ENV SKIP_COMPOSER 0
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1


# Laravel config
ENV APP_KEY base64:Yd+MjU37SbzJUwEFde45nGTAT9KgWNmqkDrb/iFVG3U=
ENV APP_ENV development 
ENV APP_DEBUG true
ENV LOG_CHANNEL stderr
EXPOSE 8080/tcp 8000/tcp
# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV NODEJS_ALLOW_SUPERUSER 1
ENV NPM_ALLOW_SUPERUSER 1
RUN chmod -R 775 .
RUN composer install
CMD ["sh","start.sh"]

