#!/usr/bin/env bash

docker build -t stephenneal/php-laravel:7 ./7/
docker build -t stephenneal/php-laravel:7.2-fpm ./7.2-fpm/
docker build -t stephenneal/php-laravel:7.3.6-fpm-v1 ./7.3.6-fpm-v1/
docker build -t stephenneal/php-laravel:7.3.6-fpm-v2 ./7.3.6-fpm-v2/
docker build -t stephenneal/php-laravel:7.3.6-fpm-v3 ./7.3.6-fpm-v3/
docker build -t stephenneal/php-laravel:7.3.7-fpm-v1 ./7.3.7-fpm-v1/
docker build -t stephenneal/php-laravel:7.3.7-fpm-buster-v1 ./7.3.7-fpm-buster-v1/
docker build -t stephenneal/php-laravel:7.4-rc-fpm-v1 ./7.4-rc-fpm-v1/