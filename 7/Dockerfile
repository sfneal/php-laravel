FROM php:7
LABEL org.opencontainers.image.authors="stephen@stephenneal.net"

# Update OS & install dependencies
RUN apt-get update -y \
	&& apt-get install -y \
		git \
		openssl \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libzip-dev \
		procps \
		unzip \
		zip

# Install Docker PHP extensions
RUN docker-php-ext-install \
	pdo \
	pdo_mysql \
	zip

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd
RUN docker-php-ext-install -j$(nproc) gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy PHP configuration files
COPY local.ini /usr/local/etc/php/conf.d/local.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf