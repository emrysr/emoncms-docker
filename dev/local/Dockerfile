FROM balenalib/amd64-debian:stretch-run as base
ENV DEBIAN_FRONTEND noninteractive
COPY qemu/arm-linux-user/qemu-arm /usr/bin

FROM openenergymonitor/emoncms:10.1.13 as emoncms
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENTRYPOINT ["tail", "-f", "/dev/null"]
