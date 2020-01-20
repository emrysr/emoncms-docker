# Offical Docker PHP & Apache image https://hub.docker.com/_/php/
FROM php:7.3.9-apache

# Install deps
RUN apt-get update && apt-get install -y \
              libcurl4-gnutls-dev \
              libmcrypt-dev \
              libmosquitto-dev \
              gettext \
              nano \
              git-core 

# Enable PHP modules
RUN docker-php-ext-install -j$(nproc) mysqli curl json gettext
RUN pecl install redis \
  \ && docker-php-ext-enable redis
RUN pecl install Mosquitto-beta \
  \ && docker-php-ext-enable mosquitto
RUN docker-php-ext-install mysqli 
    # docker-php-ext-enable mysqli
    
RUN docker-php-ext-install gettext 
    # docker-php-ext-enable gettext
RUN pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt

# Enable apache modules
RUN a2enmod rewrite

# Add custom PHP config
COPY config/php.ini /usr/local/etc/php/

# Add custom Apache config
COPY config/apache.conf /etc/apache2/sites-available/emoncms.conf
RUN a2dissite 000-default.conf
RUN a2ensite emoncms

# NOT USED ANYMORE - GIT CLONE INSTEAD
# Copy in emoncms files, files can be mounted from local FS for dev see docker-compose
# ADD ./emoncms /var/www/html

# Clone in master Emoncms repo & modules - overwritten in development with local FS files
# todo: clone in /opt/emoncms/* and link to in /var/www/emoncms/Modules/*
RUN mkdir /var/www/emoncms
RUN git clone https://github.com/emoncms/emoncms.git /var/www/emoncms
# RUN git clone https://github.com/emoncms/dashboard.git /var/www/emoncms/Modules/dashboard
# RUN git clone https://github.com/emoncms/graph.git /var/www/emoncms/Modules/graph
# RUN git clone https://github.com/emoncms/app.git /var/www/emoncms/Modules/app

COPY docker.settings.ini /var/www/emoncms/settings.ini

# Create folders & set permissions for feed-engine data folders (mounted as docker volumes in docker-compose)
RUN mkdir /var/opt/emoncms
RUN mkdir /var/opt/emoncms/phpfina
RUN mkdir /var/opt/emoncms/phptimeseries
RUN chown www-data:root /var/opt/emoncms/phpfina
RUN chown www-data:root /var/opt/emoncms/phptimeseries

# Create Emoncms logfile
RUN mkdir /var/log/emoncms
RUN touch /var/log/emoncms/emoncms.log
RUN chmod 666 /var/log/emoncms/emoncms.log

WORKDIR /var/www/emoncms

# TODO
# restart apache?
# Add Pecl :
# - dio
# - Swiftmailer
