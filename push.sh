#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Optional PLATFORM argument (if none provided, both will be built)
PLATFORM=${2:-"linux/amd64,linux/arm64"}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build & push one image
  then
    sh "${DIR}"/build.sh "${TAG}"

    FILE="${DIR}"/"${TAG}"/_docker-tags.txt

    # Check if image has multiple tags (indicated by file existence)
    if [ -f "${FILE}" ]; then
      echo "${TAG} directory has multiple Docker tags"

      while IFS= read -r line; do
        docker buildx build \
			--push \
			-t stephenneal/php-laravel:"${line}" \
			--platform "${PLATFORM}" \
			"${DIR}"/"${TAG}"/
      done < "${DIR}"/"${TAG}"/_docker-tags.txt
    else
      docker buildx build \
			--push \
			-t stephenneal/php-laravel:"${TAG}" \
			--platform "${PLATFORM}" \
			"${DIR}"/"${TAG}"/
    fi

  # Build & push all images
  else
    sh "${DIR}"/build.sh

    docker push stephenneal/php-laravel:7.4-fpm-v1
    docker push stephenneal/php-laravel:7.4-fpm-v2
    docker push stephenneal/php-laravel:7.4-fpm-v3
    docker push stephenneal/php-laravel:7.4-fpm-v3.1
    docker push stephenneal/php-laravel:7.4-fpm-composer-v1
    docker push stephenneal/php-laravel:7.4-fpm-composer-v2
    docker push stephenneal/php-laravel:8.0-fpm-base
    docker push stephenneal/php-laravel:8.0-fpm-exif
    docker push stephenneal/php-laravel:8.0-fpm-medialibrary
    docker push stephenneal/php-laravel:8.1-fpm-base
    docker push stephenneal/php-laravel:8.1-fpm-exif
    docker push stephenneal/php-laravel:8.1-fpm-medialibrary
    docker push stephenneal/php-laravel:8.2-fpm-base
    docker push stephenneal/php-laravel:8.2-fpm-exif
    docker push stephenneal/php-laravel:8.2-fpm-medialibrary
    docker push stephenneal/php-laravel:8.3-fpm-base
    docker push stephenneal/php-laravel:8.3-fpm-exif
    docker push stephenneal/php-laravel:8.3-fpm-medialibrary
    docker push stephenneal/php-laravel:8.4-fpm-base
    docker push stephenneal/php-laravel:8.4-fpm-exif
    docker push stephenneal/php-laravel:8.4-fpm-medialibrary
fi