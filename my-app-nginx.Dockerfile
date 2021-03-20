FROM nginx:1.19

WORKDIR /var/www/html


COPY . .
COPY deploy/nginx.conf /etc/nginx/nginx.conf

# Ensure file ownership for source code files
RUN chown -R www-data:www-data .

# Ensure file ownership for source code files

CMD ["nginx", "-g", "daemon off;"]