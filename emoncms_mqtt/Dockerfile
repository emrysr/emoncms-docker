FROM php:7.4.2-fpm-alpine3.11

RUN apk --update add --no-cache gettext gettext-dev \
    && docker-php-ext-install gettext mysqli \
    && pecl install redis-5.1.1 \
    && docker-php-ext-enable redis