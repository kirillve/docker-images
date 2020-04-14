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
        php7.1-curl \
        php7.1-cli \
        php7.1-gd \
        php7.1-intl \
        php7.1-json \
        php7.1-pgsql \
        php7.1-mysqli \
        php7.1-xsl \
        php7.1-mbstring \
        php7.1-bcmath \
        php7.1-zip \
        php7.1-xdebug \
        php7.1-dev \
        php-redis \
        php-pear \
        libreadline-dev \
        curl \
        unzip \
        jq \
        make \
        autoconf \
        libz-dev \
        php-dev \
    && pecl install apcu_bc \
    && echo "/usr/lib/php/20190902/apc.so" > /etc/php/7.1/cli/conf.d/apc.ini \
    && apt clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && sed -i 's/^display_errors = Off/display_errors = On/g' /etc/php/7.1/cli/php.ini \
    && sed -i 's/^display_startup_errors = Off/display_startup_errors = On/g' /etc/php/7.1/cli/php.ini \
    && sed -i 's/^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/g' /etc/php/7.1/cli/php.ini

RUN apt update \
    && apt install -y \
         apt-transport-https \
         ca-certificates \
         curl \
         gnupg2 \
         software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Update and install system base packages
# don't allow the package to install its sysctl file (causes the install to fail)
# Failed to write '262144' to '/proc/sys/vm/max_map_count': Read-only file system
RUN apt update -qq \
    && apt install -y \
        docker-ce \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose; \
    chmod +x /usr/local/bin/docker-compose

WORKDIR /app
