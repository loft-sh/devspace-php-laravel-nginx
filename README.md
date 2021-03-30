This is a showcase for developing PHP Laravel application in Kubernetes using Devspace.


Checkout and then:

```
cp .env.example .env
```

modify .env if needed

run:
```
devspace dev
```

For production make sure you apply the profile "production" profile.
```
devspace use profile production
devspace deploy
```
or
```
devspace deploy -p production
```


You can run artisan commands as follows:

```
devspace run artisan optimize
```

## TODO / Changelog (last update 20120328)
+ Remove .env from git
+ Laravel logs to stdout
+ Rebuild app image when Dockerfile changes
+ Fix nginx config root
+ Fix update-db-user hardcoded username to '${DB_USERNAME}'
+ Convert nginx:TAG TAG to variable
+ RUN npm run prod / RUN npm run dev ( insert these to the dockerfile. add to profiles)
+ Move php artisan migrate to a initContainer
+ remove xdebug
+ Rebuild and redeploy when there is change in Dockerile.
+ Add command to enter mysql db shell.
+ Replace "composer install" with "composer install --no-dev --no-interaction" on generate-key command.
- when switching to production profile we need to set APP_DEBUG to false.
- reload nignx container when the configmap nginx-config changes
- Is there a way to re-deploy one of the deployments ? e.g. I want to redeploy nginx configmap 
~ Decide whether to enable xdebug or not.

## Questions
- Despite following configuration app:php containers' logs is coming?
```
  logs:
    showLast: 100
    sync: true
    selectors:
    - containerName: nginx
```
Shall remove .env dependency all together and define default values of all in the devspace.yaml ?

What should "devspace dev -p interactive" deliver?

## Tests
+ Create files in public and see if they are uploaded and synced.
- Install another dependency via composer and see new structure works. (also document this to be used in the article)
- deploy to production

## problems
app.css request is somehow shows as canceled (in chrome developer tools, disable cache enabled, can see request with 200 status code response.), if I load css via CDN all works.
