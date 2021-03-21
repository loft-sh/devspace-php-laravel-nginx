FROM nginx:1.19

WORKDIR /var/www/html

RUN apt update \
 && apt install -y git zip php-cli\
 && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install composer dependencies (optional)
COPY composer.* ./
RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

COPY . .
COPY deploy/nginx.conf /etc/nginx/nginx.conf

# Ensure file ownership for source code files
RUN chown -R www-data:www-data .

# Ensure file ownership for source code files

CMD ["nginx", "-g", "daemon off;"]