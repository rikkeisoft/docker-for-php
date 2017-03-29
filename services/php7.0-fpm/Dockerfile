FROM php:7.0-fpm

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl4-gnutls-dev \
        libicu-dev \
        zlib1g-dev \
        git \
        build-essential \
        nodejs \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql intl opcache mbstring curl zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get autoremove \
    && apt-get clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY fix_permission.sh /usr/local/bin/fix_permission

WORKDIR /app

CMD ["php-fpm"]
