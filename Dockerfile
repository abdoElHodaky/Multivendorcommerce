FROM richarvey/nginx-php-fpm:1.9.1
RUN apk add -U --no-cache nghttp2-dev nodejs npm unzip mariadb-dev mariadb sqlite sqlite-dev
COPY . .


ENV SKIP_COMPOSER 0
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1


# Laravel config
ENV APP_ENV production
ENV APP_DEBUG true
ENV LOG_CHANNEL stderr
EXPOSE 8080/tcp 8000/tcp
# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV NODEJS_ALLOW_SUPERUSER 1
ENV NPM_ALLOW_SUPERUSER 1
RUN chmod -R 775 .
CMD ["sh","start.sh"]

