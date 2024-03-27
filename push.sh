#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build & push one image
  then
    sh "${DIR}"/build.sh "${TAG}"
    docker push stephenneal/php-laravel:"${TAG}"

  # Build & push all images
  else
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
    docker push stephenneal/php-laravel:8.0-fpm-v3
    docker push stephenneal/php-laravel:8.1-fpm-v1
    docker push stephenneal/php-laravel:8.1-fpm-v2
    docker push stephenneal/php-laravel:8.1-fpm-v3
    docker push stephenneal/php-laravel:8.1-rc-fpm-v1
    docker push stephenneal/php-laravel:8.1-rc-fpm-v1.1
    docker push stephenneal/php-laravel:8.1-rc-fpm-v2
    docker push stephenneal/php-laravel:8.2-fpm-v1
    docker push stephenneal/php-laravel:8.2-fpm-v2
    docker push stephenneal/php-laravel:8.2-fpm-v3
fi