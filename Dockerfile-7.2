FROM php:7.2-cli

ARG BUILD_DATE
ARG VCS_REF

ENV COMPOSER_NO_INTERACTION=1
ENV COMPOSER_ALLOW_SUPERUSER=1

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/laratools/laravel-ci.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="iwader.co.uk" \
      org.label-schema.name="laravel-ci" \
      org.label-schema.description="Docker for Laravel in a CI environment" \
      org.label-schema.url="https://github.com/laratools/laravel-ci"

ENV NVM_VERSION v0.33.5

RUN apt-get update

# Required to add yarn package repository
RUN apt-get install -y apt-transport-https gnupg

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
        libbz2-dev \
        libsodium-dev \
        git \
        unzip \
        wget \
        libpng-dev \
        libgconf-2-4 \
        libfontconfig1 \
        chromium \
        xvfb \
        yarn

RUN docker-php-ext-install -j$(nproc) \
        bcmath \
        bz2 \
        calendar \
        exif \
        gd \
        sodium \
        pdo_mysql \
        shmop \
        sockets \
        sysvmsg \
        sysvsem \
        sysvshm \
        zip

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

COPY ./scripts ./scripts

RUN ./scripts/composer.sh

CMD ["bash", "/scripts/start.sh"]