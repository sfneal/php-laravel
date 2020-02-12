FROM php:7.4-fpm
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS && install utilities
#  - graphviz (dependency of erd-generator composer package)
RUN apt-get update -y && apt-get install -y \
	curl \
    git \
	graphviz \
    openssl \
    libgmp-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libzip-dev \
    procps \
    unzip \
    zip \
    zlib1g-dev

# Install PHP-GD extension (dependency of composer phpoffice/phpspreadsheet)
RUN docker-php-ext-configure intl \
	&& docker-php-ext-configure gd \
		--with-freetype=/usr/include/ \
		--with-jpeg=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install \
        gmp \
        intl \
        pdo \
        pdo_mysql \
        zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy PHP configuration files
COPY local.ini /usr/local/etc/php/conf.d/local.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf