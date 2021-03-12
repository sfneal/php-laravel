# sfneal/php-laravel

[![Build Status](https://travis-ci.com/sfneal/php-laravel.svg?branch=master&style=flat-square)](https://travis-ci.com/sfneal/php-laravel)
[![Total Downloads](https://img.shields.io/docker/pulls/stephenneal/php-laravel?style=flat-square)](https://hub.docker.com/r/stephenneal/php-laravel)
[![Latest Version](https://img.shields.io/docker/v/stephenneal/php-laravel?sort=semver&style=flat-square)](https://hub.docker.com/r/stephenneal/php-laravel)

php-laravel is a php-fpm based image with PHP & Docker extensions needed for most Laravel application preinstalled.

## Installation

Docker images can be pulled using the Docker CLI.

```bash
docker pull stephenneal/php-laravel:8.0-fpm-v1
```

## Usage

After both front-end & back-end dependencies are installed in intermediate images, the essential files can be copied to the final image.

```dockerfile
# Build PHP-fpm running image
FROM stephenneal/php-laravel:${php_laravel_tag}
WORKDIR /var/www
EXPOSE 9000
VOLUME ["/var/www"]

# Copy relevant files from back-end build
COPY --from=composer /var/www .

# Copy relevant files from front-end build
COPY --from=node /var/www .
```

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

### Security

If you discover any security related issues, please email stephen.neal14@gmail.com instead of using the issue tracker.

## Credits

- [Stephen Neal](https://github.com/sfneal)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
