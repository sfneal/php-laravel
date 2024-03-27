FROM php:7.3.6-fpm
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS
RUN apt-get update -y && apt-get install -y openssl zip unzip git

# Install process info utilities
RUN apt-get install -y procps

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libzip-dev

# Install Docker PHP extensions
RUN docker-php-ext-install pdo pdo_mysql zip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create a new group
RUN groupadd -r phpusers && useradd -r -g phpusers user

# Use the USER instruction to switch to the new user
USER myuser