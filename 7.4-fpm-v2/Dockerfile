FROM php:7.4-fpm
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS && install utilities
RUN apt-get update -y \
	&& apt-get install -y \
		g++ \
	    git \
		libgmp-dev \
	    libfreetype6-dev \
	    libicu-dev \
	    libjpeg62-turbo-dev \
	    libzip-dev \
	    openssl \
	    procps \
	    unzip \
	    zip \
	    zlib1g-dev

# Install Docker PHP extensions
RUN docker-php-ext-configure intl \
	&& docker-php-ext-install \
		gmp \
		intl \
		pcntl \
	    pdo \
	    pdo_mysql \
	    zip

# Create a new group
RUN groupadd -r phpusers && useradd -r -g phpusers user

# Use the USER instruction to switch to the new user
USER user