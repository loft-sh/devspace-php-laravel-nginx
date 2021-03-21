FROM php:7.4-fpm

WORKDIR /var/www/html


RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql dom mbstring && docker-php-ext-enable pdo_mysql dom mbstring

RUN apt update \
 && apt install -y git zip \
 && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install composer dependencies (optional)
COPY composer.* ./
RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

# Add source code files to WORKDIR
COPY . .

# Ensure file ownership for source code files
RUN chown -R www-data:www-data .



CMD ["php-fpm"]