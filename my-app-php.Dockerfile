FROM php:7.4-fpm

WORKDIR /var/www/html



RUN apt update \
 && apt install -y git zip libxml2-dev libonig-dev\
 && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

# Install MySQL extensions
RUN docker-php-ext-install xml mbstring mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Add source code files to WORKDIR
COPY . .

# Install composer dependencies (optional)
RUN composer install --no-dev --no-interaction



# Ensure file ownership for source code files
RUN chown -R www-data:www-data .

RUN chmod 777 /var/www/html/storage/logs/
RUN chmod 777 /var/www/html/storage/logs/*


CMD ["php-fpm"]