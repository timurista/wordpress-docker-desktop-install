# Installing Wordpress on Docker Desktop
A repository for spinning up wordpress locally using docker-desktop for plugin and theme development

## Why docker-desktop?
On Mac or Linux you can install [docker-desktop for free](https://www.docker.com/products/docker-desktop). From there we will install a temporary wordpress server for local testing using the [wordpress helm chart]() w.

You could install wordpress via Xampp, apache, or [server press](https://serverpress.com/) and get hassled with undless will-you-upgrade-now-please reminders. Plus it pollutes your local system with resources for apache server that can be a pain to remove later.

With this approach of kubernetes, docker-desktop and helm chart you retain control over server, it's resources and can do locally testing quickly and easily. Because it uses docker and kubernetes, it's easy to isolate resources and remove the server files from your computer whenever you need.

# The installation steps

- [install docker desktop](https://www.docker.com/products/docker-desktop)
- open Docker Desktop and ensure [kubernetes is running](https://birthday.play-with-docker.com/kubernetes-docker-desktop/)
- select the `docker-desktop` enviornment from the kubernetes tab
- Run this to verify you have the correct kubernetes context selected for local testing.
```shell
# verify these commands return version numbers
$ kubectl --version
$ docker --version

$ kubectl config current-context             [7:03:13]
docker-desktop
```
- run the script
```
$ chmod -R 755 scripts
$ ./scripts/install-wordpress.sh

# NOTE: it might take a few minutes to rollout
# verify the db and pod is loaded by checking the status
# on the pods is Ready for wordpress and mariadb
$ kubectl get pods
my-wordpress-5d946d7595-z5rkw   1/1     Running   0          11m
my-wordpress-mariadb-0          1/1     Running   0          11m

# see password username after
$ ./scripts/creds.sh
=====
WordPress URL: http://localhost:8007/
WordPress Admin URL: http://localhost:8007/admin
======
Username: user
Password: XXXXXX
```


# Install
Note you might need to download and provider permissions first for these scripts

```sh
curl -sS https://raw.githubusercontent.com/timurista/wordpress-docker-desktop-install/main/scripts/install-wordpress.sh | sh -
```

## Uninstall
```sh
curl -sS https://raw.githubusercontent.com/timurista/wordpress-docker-desktop-install/main/scripts/uninstall-wordpress.sh | sh -
```
