This is a showcase for developing an PHP Laravel application in Kubernetes using Devspace. This repository is complimentary to [PHP Laravel Development with Kubernetes using DevSpace - Developer Edition](https://loft.sh/blog/php-laravel-development-with-kubernetes-devspace) blog post.

## Quicktart

### Checkout
```
git clone git@github.com:loft-sh/devspace-php-laravel-nginx.git
```
### Copy .env.example
```
cp .env.example .env
```

### Modify .env if needed

### Generate APP KEY
```
devspace run generate-key
```

### List and fill in required vars
```
devspace list vars
```
 

### Run DevSpace in development mode.
```
devspace dev
```

### Production

For production make sure you apply the profile "production" profile.
```
devspace use profile production
devspace deploy
```
or
```
devspace deploy -p production
```

