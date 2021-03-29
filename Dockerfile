FROM php:7.4-fpm as php-base

WORKDIR /var/www/html

# Install composer
RUN apt-get update \
 && apt-get install -y git zip libxml2-dev libonig-dev libnotify-bin\
 && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install MySQL extensions
RUN docker-php-ext-install xml mbstring mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql \
 && apt-get -y install mariadb-client

# Install Redis extension
RUN pecl install redis \
    && docker-php-ext-enable redis

# Install nodejs and npm
RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs


FROM php-base
# Add project code to WORKDIR
COPY . .

# Install composer dependencies 
RUN composer install --no-dev --no-interaction

# Install nodejs dependencies
RUN npm install

# Forward Laravel logs to stderr
RUN ln -sf /dev/stdout /var/www/html/storage/logs/laravel.log

# Ensure file ownership for source code files
RUN chown -R www-data:www-data .

# Do not run container as root in production
USER www-data

CMD ["php-fpm"]