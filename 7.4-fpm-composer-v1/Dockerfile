FROM php:7.4-fpm
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS && install utilities
RUN apt-get update -y && apt-get install -y \
	curl \
    openssl \
    zip \
    unzip \
    git \
    procps \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libzip-dev \
	libgmp-dev

# Install Docker PHP extensions
RUN docker-php-ext-install \
	gmp \
    pdo \
    pdo_mysql \
    zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy PHP configuration files
COPY local.ini /usr/local/etc/php/conf.d/local.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf