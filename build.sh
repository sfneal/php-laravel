#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t stephenneal/php-laravel:7 "${DIR}"/7/
docker build -t stephenneal/php-laravel:7.2-fpm "${DIR}"/7.2-fpm/
docker build -t stephenneal/php-laravel:7.3-fpm-v1 "${DIR}"/7.3-fpm-v1/
docker build -t stephenneal/php-laravel:7.3.6-fpm-v1 "${DIR}"/7.3.6-fpm-v1/
docker build -t stephenneal/php-laravel:7.3.6-fpm-v2 "${DIR}"/7.3.6-fpm-v2/
docker build -t stephenneal/php-laravel:7.3.6-fpm-v3 "${DIR}"/7.3.6-fpm-v3/
docker build -t stephenneal/php-laravel:7.3.7-fpm-v1 "${DIR}"/7.3.7-fpm-v1/
docker build -t stephenneal/php-laravel:7.3.7-fpm-v1 "${DIR}"/7.3.7-fpm-v1/
docker build -t stephenneal/php-laravel:7.4-fpm-v1 "${DIR}"/7.4-fpm-v1/
docker build -t stephenneal/php-laravel:7.4-fpm-v2 "${DIR}"/7.4-fpm-v2/
docker build -t stephenneal/php-laravel:7.4-fpm-v3 "${DIR}"/7.4-fpm-v3/
docker build -t stephenneal/php-laravel:7.4-fpm-v4 "${DIR}"/7.4-fpm-v4/
docker build -t stephenneal/php-laravel:7.4-fpm-composer-v1 "${DIR}"/7.4-fpm-composer-v1/
docker build -t stephenneal/php-laravel:7.4-fpm-composer-v2 "${DIR}"/7.4-fpm-composer-v2/
docker build -t stephenneal/php-laravel:7.4-rc-fpm-v1 "${DIR}"/7.4-rc-fpm-v1/
docker build -t stephenneal/php-laravel:8.0-rc-fpm-v1 "${DIR}"/8.0-rc-fpm-v1/
docker build -t stephenneal/php-laravel:8.0-rc-fpm-v2 "${DIR}"/8.0-rc-fpm-v2/