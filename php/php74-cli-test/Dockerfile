FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt update -qq \
    && apt -y dist-upgrade \
    && apt install -y wget apt-transport-https apt-utils gnupg2 \
    && echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list \
    && wget --quiet -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt update \
    && apt install -y \
        postgresql-client-12 \
        php7.4-curl \
        php7.4-cli \
        php7.4-intl \
        php7.4-json \
        php7.4-pgsql \
        php7.4-xsl \
        php7.4-mbstring \
        php7.4-bcmath \
        php7.4-zip \
        php7.4-xdebug \
        php7.4-dev \
        php-redis \
        php-pear \
        libreadline-dev \
        curl \
        unzip \
        jq \
        make \
        autoconf \
        libz-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man

RUN pecl install xdebug
RUN echo "zend_extension=/usr/lib/php/20190902/xdebug.so" > /etc/php/7.4/cli/conf.d/90-xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && sed -i 's/^display_errors = Off/display_errors = On/g' /etc/php/7.4/cli/php.ini \
    && sed -i 's/^display_startup_errors = Off/display_startup_errors = On/g' /etc/php/7.4/cli/php.ini \
    && sed -i 's/^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/g' /etc/php/7.4/cli/php.ini

WORKDIR /app
