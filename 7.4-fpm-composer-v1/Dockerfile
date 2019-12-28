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

# Install PHP-GD extension (required to composer install phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd \
		--with-freetype=/usr/include/ \
		--with-jpeg=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        zip \
		gmp

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy PHP configuration files
COPY local.ini /usr/local/etc/php/conf.d/local.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf