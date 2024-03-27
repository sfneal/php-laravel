FROM php:7.4-fpm
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS && install utilities
#  - graphviz (dependency of erd-generator composer package)
RUN apt-get update -y && apt-get install -y \
	curl \
    git \
	graphviz \
    openssl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libzip-dev \
	libgmp-dev \
    procps \
    unzip \
    zip

# Install PHP-GD extension (dependency of composer phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd \
		--with-freetype=/usr/include/ \
		--with-jpeg=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install \
        pcntl \
        pdo \
        pdo_mysql \
        zip \
		gmp

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy PHP configuration files
COPY local.ini /usr/local/etc/php/conf.d/local.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# Create a new group
RUN groupadd -r phpusers && useradd -r -g phpusers user

# Use the USER instruction to switch to the new user
USER myuser