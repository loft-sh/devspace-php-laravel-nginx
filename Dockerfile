FROM php:7.4-fpm

WORKDIR /var/www/html

# Install composer
RUN apt update \
 && apt install -y git zip libxml2-dev libonig-dev libnotify-bin\
 && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install MySQL extensions
RUN docker-php-ext-install xml mbstring mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql \
 && apt -y install mariadb-client

# Install Redis extension
RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

# Install nodejs and npm
RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash -
RUN apt update
RUN apt install -y nodejs

# Add project code to WORKDIR
COPY . .

# Install composer dependencies
RUN composer install --no-dev --no-interaction

# Install nodejs dependencies
RUN npm install

# Optimize for production
RUN php artisan optimize
RUN npm run prod

# Ensure file ownership for source code files
RUN chown -R www-data:www-data .

# Do not run container as root in production
USER www-data

CMD ["php-fpm"]