#!/usr/bin/env bash

# Base directory containing source code
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

PLATFORM=${2:-"linux/amd64,linux/arm64"}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build one image
  then
    FILE="${DIR}"/"${TAG}"/_docker-tags.txt

    # Check if image has multiple tags (indicated by file existence)
    if [ -f "${FILE}" ]; then
      echo "${TAG} directory has multiple Docker tags"

      TAGS=""
      while IFS= read -r line; do
        TAGS="${TAGS} -t stephenneal/php-laravel:${line}"
      done < "${DIR}"/"${TAG}"/_docker-tags.txt

      COMMAND="docker buildx build --load ${TAGS} --platform "${PLATFORM}" ${DIR}/${TAG}/"
      echo "${COMMAND}"
      $(echo "${COMMAND}")
    else
      docker buildx build \
      	--load \
      	-t stephenneal/php-laravel:"${TAG}" \
      	--platform "${PLATFORM}" \
      	"${DIR}"/"${TAG}"/
    fi

  # Build all images
  else
    docker build -t stephenneal/php-laravel:7 "${DIR}"/7/
    docker build -t stephenneal/php-laravel:7.2-fpm "${DIR}"/7.2-fpm/
    docker build -t stephenneal/php-laravel:7.3-fpm-v1 "${DIR}"/7.3-fpm-v1/
#    docker build -t stephenneal/php-laravel:7.3.6-fpm-v1 "${DIR}"/7.3.6-fpm-v1/
#    docker build -t stephenneal/php-laravel:7.3.6-fpm-v2 "${DIR}"/7.3.6-fpm-v2/
#    docker build -t stephenneal/php-laravel:7.3.6-fpm-v3 "${DIR}"/7.3.6-fpm-v3/
    docker build -t stephenneal/php-laravel:7.3.7-fpm-v1 "${DIR}"/7.3.7-fpm-v1/
    docker build -t stephenneal/php-laravel:7.3.7-fpm-v1 "${DIR}"/7.3.7-fpm-v1/
    docker build -t stephenneal/php-laravel:7.4-fpm-v1 "${DIR}"/7.4-fpm-v1/
    docker build -t stephenneal/php-laravel:7.4-fpm-v2 "${DIR}"/7.4-fpm-v2/
    docker build -t stephenneal/php-laravel:7.4-fpm-v3 "${DIR}"/7.4-fpm-v3/
    docker build -t stephenneal/php-laravel:7.4-fpm-v3.1 "${DIR}"/7.4-fpm-v3.1/
    docker build -t stephenneal/php-laravel:7.4-fpm-composer-v1 "${DIR}"/7.4-fpm-composer-v1/
    docker build -t stephenneal/php-laravel:7.4-fpm-composer-v2 "${DIR}"/7.4-fpm-composer-v2/
    docker build -t stephenneal/php-laravel:8.0-fpm-base "${DIR}"/8.0-fpm-base/
    docker build -t stephenneal/php-laravel:8.0-fpm-exif "${DIR}"/8.0-fpm-exif/
    docker build -t stephenneal/php-laravel:8.0-fpm-medialibrary "${DIR}"/8.0-fpm-medialibrary/
    docker build -t stephenneal/php-laravel:8.1-fpm-base "${DIR}"/8.1-fpm-base/
    docker build -t stephenneal/php-laravel:8.1-fpm-exif "${DIR}"/8.1-fpm-exif/
    docker build -t stephenneal/php-laravel:8.1-fpm-medialibrary "${DIR}"/8.1-fpm-medialibrary/
    docker build -t stephenneal/php-laravel:8.2-fpm-base "${DIR}"/8.2-fpm-base/
    docker build -t stephenneal/php-laravel:8.2-fpm-exif "${DIR}"/8.2-fpm-exif/
    docker build -t stephenneal/php-laravel:8.2-fpm-medialibrary "${DIR}"/8.2-fpm-medialibrary/
    docker build -t stephenneal/php-laravel:8.3-fpm-base "${DIR}"/8.3-fpm-base/
    docker build -t stephenneal/php-laravel:8.3-fpm-exif "${DIR}"/8.3-fpm-exif/
    docker build -t stephenneal/php-laravel:8.3-fpm-medialibrary "${DIR}"/8.3-fpm-medialibrary/
    docker build -t stephenneal/php-laravel:8.4-fpm-base "${DIR}"/8.4-fpm-base/
    docker build -t stephenneal/php-laravel:8.4-fpm-exif "${DIR}"/8.4-fpm-exif/
    docker build -t stephenneal/php-laravel:8.4-fpm-medialibrary "${DIR}"/8.4-fpm-medialibrary/
fi