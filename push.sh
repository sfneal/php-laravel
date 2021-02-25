#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sh "${DIR}"/build.sh

docker push stephenneal/php-laravel:7
docker push stephenneal/php-laravel:7.2-fpm
docker push stephenneal/php-laravel:7.3-fpm-v1
docker push stephenneal/php-laravel:7.3.6-fpm-v1
docker push stephenneal/php-laravel:7.3.6-fpm-v2
docker push stephenneal/php-laravel:7.3.6-fpm-v3
docker push stephenneal/php-laravel:7.3.7-fpm-v1
docker push stephenneal/php-laravel:7.3.7-fpm-v1
docker push stephenneal/php-laravel:7.4-fpm-v1
docker push stephenneal/php-laravel:7.4-fpm-v2
docker push stephenneal/php-laravel:7.4-fpm-v3
docker push stephenneal/php-laravel:7.4-fpm-v3.1
docker push stephenneal/php-laravel:7.4-fpm-composer-v1
docker push stephenneal/php-laravel:7.4-fpm-composer-v2
docker push stephenneal/php-laravel:7.4-rc-fpm-v1
docker push stephenneal/php-laravel:8.0-fpm-v1
docker push stephenneal/php-laravel:8.0-fpm-v2
docker push stephenneal/php-laravel:rc-fpm-v1
docker push stephenneal/php-laravel:rc-fpm-v1.1