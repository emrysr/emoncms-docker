FROM php:7.4-fpm-alpine
RUN apk update && apk upgrade \
    && apk add --no-cache autoconf gettext gettext-dev musl-dev gcc make libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) gettext mysqli \
    && yes "" | pecl install redis-5.1.1 \
    && yes "" | pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable redis mcrypt

WORKDIR /var/www/emoncms