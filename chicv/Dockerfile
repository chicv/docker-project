FROM ubuntu

RUN useradd chicv -p chicv -s /bin/bash
MAINTAINER chicv

ENV LANG=C.UTF-8
ARG DEBIAN_FRONTED=noninteractive
RUN   apt-get clean \
   && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5  \
   && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 \
   && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  4F4EA0AAE5267A6C \
   && apt-get update \
   && apt-get upgrade -y \
   && apt-get install aptitude bash-completion -y \
   && aptitude install sudo \
   && echo 'chicv   ALL=(ALL)  NOPASSWD:ALL' >> /etc/sudoers \
   && apt-get install apt-utils -y \
   && apt-get install software-properties-common python-software-properties -y \
   && apt-get install apt-transport-https -y \
   && add-apt-repository ppa:ondrej/php \
   && apt-get update


RUN apt-get install php7.1 php7.1-common  -y --allow-unauthenticated \
 && apt-get install php7.1-curl php-redis php7.1-xml php7.1-zip php7.1-gd php7.1-mysql php7.1-mbstring -y --allow-unauthenticated \
 && apt-get install php7.1-fpm php7.1-cli php7.1-interbase php7.1-json php7.1-intl  -y --allow-unauthenticated  \
 && apt-get install php7.1-opcache php7.1-mcrypt php7.1-readline  -y  --allow-unauthenticated \
 && apt-get install nginx composer dnsmasq -y \
 && apt-get install vim -y \
 && apt-get install -y net-tools


RUN  apt-get install wget git redis-server  -y \
  && mkdir /home/chicv/logs/www-log -p \
  && chown chicv:chicv /home/chicv/ -R \
  && chmod 755 /home/chicv \
  && chmod 777 /home/chicv/logs -R


COPY  nginx.conf  /etc/nginx/nginx.conf
COPY  bashrc  /home/chicv/.bashrc
COPY id_rsa /home/chicv/.ssh/id_rsa
COPY id_rsa.pub /home/chicv/.ssh/id_rsa.pub
RUN sed -i "s/error_log = \/var\/log\/php7.1-fpm.log/error_log = \/home\/chicv\/logs\/php7-error.log/" /etc/php/7.1/fpm/php-fpm.conf \
    && sed -i "s/^error_reporting\s=\sE_ALL\s&\s~E_DEPRECATED\s&\s~E_STRICT$/error_reporting = E_ALL/g" /etc/php/7.1/fpm/php.ini \
    && sed -i "s/^display_errors = Off$/display_errors = On/g" /etc/php/7.1/fpm/php.ini \
    && sed -i "s/user = www-data/user = chicv/" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "s/group = www-data/group = chicv/" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "s/listen.owner = www-data/listen.owner = chicv/" /etc/php/7.1/fpm/pool.d/www.conf \
    && sed -i "s/listen.group = www-data/listen.group = chicv/" /etc/php/7.1/fpm/pool.d/www.conf \
    && echo "nameserver 8.8.8.8" > /etc/resolv.dnsmasq \
    && sed -i "s/^#resolv-file.*$/resolv-file=\/etc\/resolv.dnsmasq/" /etc/dnsmasq.conf  \
    && sed -i /\ SCRIPT_FILENAME\ /d /etc/nginx/fastcgi_params \
    && echo "address=/.app/127.0.0.1 " >>  /etc/dnsmasq.conf \
    && chmod 644 /home/chicv/.ssh/id_rsa.pub\
    && chmod 700 /home/chicv/.ssh \
    && chown chicv:chicv /home/chicv -R

CMD /home/chicv/Cmd/startUp.sh  && /bin/bash
USER chicv
WORKDIR /home/chicv
RUN echo 'thanks for building'

