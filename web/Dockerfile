FROM nginx:1.17-alpine

# install git client and clone files from github
RUN apk add --update git && rm -rf /var/cache/apk/* \
&& git clone https://github.com/emoncms/emoncms.git /var/www/emoncms \
&& git clone https://github.com/emoncms/device.git /var/www/emoncms/Modules/device

COPY settings.ini /var/www/emoncms/settings.ini
COPY site.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/emoncms

