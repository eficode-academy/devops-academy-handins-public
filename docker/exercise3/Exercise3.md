# Exercise 3: Wordpress with Reverse Proxy using docker-compose

In this exercise we will create a declarative multi-container setup using `docker-compose`.

The application we will use is `wordpress`, which consists of the wordpress application itself and a `mysql` database, so two containers.

We will run wordpress behind a reverse proxy, for this we will use `nginx`.

The wordpress "stack" will thus be **three containers total.**

We will be using `named volumes` to persist data.

In the [Compose file reference](https://docs.docker.com/compose/compose-file/compose-file-v3/#compose-file-structure-and-examples) you can look up how to configure all of the different parameters.

## Tasks

**You must use the template provided: `exercise3/docker-compose.yaml`, if you do not use the template your hand-in will not be graded!**

Write a `docker-compose.yaml` declarative specification:

- Define two named volumes:
  - A volume named `wordpress`
  - A volume named `db`
- Define three services: (in docker-compose a `service` represents a container to be run)
  - Define a service named `reverse-proxy-nginx`.
    - Use the provided Dockerfile `exercise3/Dockerfile` to build an nginx image with the provided nginx config file `exercise3/nginx.conf`
      - Use a `build` key in the service, which specifies the `context` and `dockerfile` to use.
      - [Relevant Docs](https://docs.docker.com/compose/compose-file/compose-file-v3/#build)
    - Must port-forward host port 80 to container port 80
    - The container name must be `nginx`
    - You can check that the image builds with the command: `$ cd exercise3 && docker-compose build`
  - Define a service named `wordpress`.
    - Use the official wordpress image with tag `wordpress:5.7.2-apache`.
    - Configure the environment variables to connect to the database.
      - You can find documentation on the environment variables that you must configure on the docker hub page.
    - The container must not port-forward any ports
    - The container must mount the `wordpress` volume to the path `/var/www/html`
    - The container name must be `wordpress`
  - Define a service named `db`.
    - Use the official mysql image with tag `mysql:5.7.36`.
    - Configure environment variables to create an initial database and set user credentials.
      - You can find documentation on the environment variables that you must configure on the docker hub page.
    - The container must mount the `db` volume to the path `/var/lib/mysql`
    - The container name must be `db`

When you have defined all of the services, try to start your wordpress stack with the command `$ docker-compose up -d`.
When you are satisfied that your wordpress setup works correctly, stop the stack with the command `$ docker-compose down -v`.

### Checker

You can use the included checker script to check your `docker-compose.yaml` file:

```shell
bash check.sh --exercise3
```

When the script runs without any errors, you have solved the exercise.

### Optional Extras

These are some suggestions for writing the best possible docker-compose file, but is not part of what is graded.

If you want to write the best possible docker-compose file consider the following:

- Networking:
  - In the default configuration when you start a docker-compose stack, docker will create a default docker network for you, and attach all of your defined services.
  - This is fine for simple setups, but if you want to limit the access to your different services, then you can explicitly create multiple networks and attach specific services to them.
  - You could for example create a network that only the nginx and wordpress instances are connected to - call this network `proxy`, and a database network that only the wordpress and the mysql instances are connected to - call this network `db`.
