FROM debian:stretch-slim

SHELL ["/bin/bash", "-c"]
STOPSIGNAL SIGTERM
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /app

# System update
RUN set -x && \
    apt update -qq && \
    apt -y dist-upgrade && \
    apt install -y wget apt-transport-https apt-utils gnupg2

RUN echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list && \
    wget --quiet -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update \
    && apt-get install -y \
        postgresql-client-11 \
        php7.4-curl \
        php7.4-cli \
        php7.4-intl \
        php7.4-json \
        php7.4-pgsql \
        php7.4-xsl \
        php7.4-mbstring \
        php7.4-bcmath \
        php7.4-zip \
        php-redis \
        php-pear \
        unzip \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man
