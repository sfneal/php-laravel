FROM php:7.3-fpm
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS && install utilities
RUN apt-get update -y && apt-get install -y \
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

