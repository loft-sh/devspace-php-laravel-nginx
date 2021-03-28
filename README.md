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
devspace run php artisan optimize
```
## TODO / Changelog (last update 20120328)
+ remove .env from git
+ laravel logs to stdout
- reload nignx container when the configmap nginx-config changes
- is there a way to re-deploy one of the deployments ? e.g. I want to redeploy nginx configmap 
+ rebuild app image when Dockerfile changes
+ fix nginx config root
+ fix update-db-user hardcoded username to '${DB_USERNAME}'
+ covert nginx:TAG TAG to variable
+ RUN npm run prod / RUN npm run dev ( insert these to the dockerfile. add to profiles)
    note: this required adding appendDockerfileInstructions 
+ move php artisan migrate to a initContainer
~ decide whether to enable xdebug or not.
+ make xdebug conditional using profiles, production shouldn't include it.
- how to make sure xdebug connection is established? if we can not no point in installing xdebug
+ rebuild and redeploy when there is change in Dockerile
+ add command to enter mysql db shell.

## Tests
+ create files in public and see if they are uploaded and synced