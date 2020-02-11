FROM php:fpm-alpine

RUN apk --update add --no-cache gettext gettext-dev \
    && docker-php-ext-install gettext mysqli \
    && pecl install redis-5.1.1 \
    && docker-php-ext-enable redis

# RUN apk add gettext gettext-dev
# RUN docker-php-ext-install gettext mysqli
# RUN pecl install redis-5.1.1
# # Could not download from "https://pecl.php.net/get/redis-5.1.1.tgz", 
# # cannot download "pecl/redis" (Connection to `ssl://pecl.php.net:443' failed: )
# # Error: cannot download "pecl/redis"
# 
# RUN docker-php-ext-enable redis
