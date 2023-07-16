FROM richarvey/nginx-php-fpm:1.9.1
RUN apk add -U --no-cache nghttp2-dev nodejs npm unzip
COPY . .


ENV SKIP_COMPOSER 0
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_KEY base64:Yd+MjU37SbzJUwEFde45nGTAT9KgWNmqkDrb/iFVG3U=
ENV APP_ENV production
ENV APP_DEBUG true
ENV LOG_CHANNEL stderr

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV NODEJS_ALLOW_SUPERUSER 1
ENV NPM_ALLOW_SUPERUSER 1
RUN rm yarn.lock
RUN rm package-lock.json
RUN npm install -g mix
RUN npm install --package-lock-only
ENV YARN_ALLOW_SUPERUSER 1
ENV NPX_ALLOW_SUPERUSER 1
RUN npm audit fix --force
RUN npm run production
CMD ["/start.sh"]

