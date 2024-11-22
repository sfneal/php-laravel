#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

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
        docker push stephenneal/php-laravel:"${line}"
      done < "${DIR}"/"${TAG}"/_docker-tags.txt
    else
      docker push stephenneal/php-laravel:"${TAG}"

      # Confirm the Tag is NOT an Release Candidate before pushing
      if [ "$PUSH_LATEST" != null ]; then
          docker tag stephenneal/php-laravel:"${TAG}" stephenneal/php-laravel:"${LATEST}"
          docker push stephenneal/php-laravel:"${LATEST}"
      fi
    fi

  # Build & push all images
  else
    sh "${DIR}"/build.sh

    docker push stephenneal/php-laravel:7
    docker push stephenneal/php-laravel:7.2-fpm
    docker push stephenneal/php-laravel:7.3-fpm-v1
#    docker push stephenneal/php-laravel:7.3.6-fpm-v1
#    docker push stephenneal/php-laravel:7.3.6-fpm-v2
#    docker push stephenneal/php-laravel:7.3.6-fpm-v3
    docker push stephenneal/php-laravel:7.3.7-fpm-v1
    docker push stephenneal/php-laravel:7.3.7-fpm-v1
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