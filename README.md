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
- reload nignx container when the configmap nginx-config changes
- Is there a way to re-deploy one of the deployments ? e.g. I want to redeploy nginx configmap 
+ Rebuild app image when Dockerfile changes
+ Fix nginx config root
+ Fix update-db-user hardcoded username to '${DB_USERNAME}'
+ Convert nginx:TAG TAG to variable
+ RUN npm run prod / RUN npm run dev ( insert these to the dockerfile. add to profiles)
    note: this required adding appendDockerfileInstructions 
+ Move php artisan migrate to a initContainer
~ Decide whether to enable xdebug or not.
+ Make xdebug conditional using profiles, production shouldn't include it.
- How to make sure xdebug connection is established? if we can not no point in installing xdebug
+ Rebuild and redeploy when there is change in Dockerile.
+ Add command to enter mysql db shell.
+ Replace "composer install" with "composer install --no-dev --no-interaction" on generate-key command.

## Questions
- Despite following configuration app:php containers' logs is coming?
```
  logs:
    showLast: 100
    sync: true
    selectors:
    - containerName: nginx
```
## Tests
+ Create files in public and see if they are uploaded and synced.
- Install another dependency via composer and see new structure works. (also document this to be used in the article)