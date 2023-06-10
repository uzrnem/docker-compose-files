FROM php:8.0-apache

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get dist-upgrade -y && \
  apt-get -y autoremove && \
  apt-get clean

RUN apt-get -y install git zip unzip libpq-dev

RUN docker-php-ext-install pdo mysqli pdo_mysql pgsql pdo_pgsql
# RUN apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql pgsql
# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

WORKDIR /phinx

COPY phinx.php /phinx/.

RUN curl -s https://getcomposer.org/installer | php

RUN php composer.phar require robmorgan/phinx

ENTRYPOINT ["tail", "-f", "/dev/null"]