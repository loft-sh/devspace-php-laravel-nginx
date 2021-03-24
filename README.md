This is showcase for developing php/laravel application in Kubernetes using devspace.


Checkout and then:

```
cp .env.example .env
```

modify .env

run:
```
devspace dev
```

For production make sure you apply the profile "production
```
devspace use profile production
```

Be aware that Nginx configuration map (default called nginx-config) will be deleted and re-created on deploy and deleted after purge/




## TODO
- npm run dev vs npm run prod, we need to add to profile and inject it on entry point
- favicon.ico
