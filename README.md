This is a showcase for developing PHP Laravel application in Kubernetes using Devspace.


Checkout and then:

```
cp .env.example .env
```

modify .env

run:
```
devspace dev
```

For production make sure you apply the profile "production" profile.
```
devspace use profile production
devsapce deploy
```
or
```
devspace deploy -p production
```


You can run artisan commands as follows:

```
devspace run php artisan optimize
```
## TODO
