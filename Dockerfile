################ Development Stage ################
# Development stage will be used for development
# Run: devspace dev (see devspace.yaml docker target)
###################################################
FROM php:7.4-fpm as dev
ARG NODE_ENV_ARG=development
ENV NODE_ENV=$NODE_ENV_ARG

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

# Add project code to WORKDIR
COPY . .

# Install composer dependencies
RUN composer install --no-dev --no-interaction

# Install nodejs dependencies
RUN NODE_ENV=development npm install

# Forward Laravel logs to stdout
RUN ln -sf /dev/stdout /var/www/html/storage/logs/laravel.log

CMD ["php-fpm"]


################ Production Stage #######@#########
# Production stage will be used for deployment
# Run: devspace deploy
###################################################
FROM dev as production

WORKDIR /var/www/html

# Optimize for production
RUN php artisan optimize

RUN npm run prod

# Ensure file ownership for source code files
RUN chown -R www-data:www-data .

# Do not run container as root in production
USER www-data

