# Docker Hand-in

TODO intro

## Automatic Checker

**If you do not use the template, your hand-in will not be graded!**

TODO explain

## 1. The multi-color TOIlet

The `TOIlet` (... or “The Other Implementation’s letters”, a free software implementation of `figlet`) application is a Linux CLI utility that takes an input string and produces ASCII art letters of the string, and optionally applies effects.

The first exercise is to write a `Dockerfile` which contains the `toilet` application, and can be used to generate colorful ASCII text art.

See [TOIlet's website](http://caca.zoy.org/wiki/toilet) for more info.

### Tasks:

**You must use the template provided: `exercise1/Dockerfile`, if you do not use the template your hand-in will not be graded!**

Write a `Dockerfile` that:

- Uses Ubuntu 20.04 as the base image.
- Installs `toilet` with `apt-get`.
- The default behaviour of the image should be to run the command: `toilet -F border --gay`.
  - If the user does not input a string, then the default string returned should be "hello world".
- Build your dockerfile with `$ docker build -t <your-username>/toilet exercise1`
  - (if you `cd` to the `exercise1` directory, you must change the context in the command `$ docker build -t <your-username>/toilet .`)
- Try to run a container from your dockerfile with `docker run <your-username>/toilet` which should print the default "hello world".

You may write the Dockerfile in any way that you like, as long as the command:

```shell
$ docker run <your-username>/toilet docker
┌──────────────────────────────────────────┐
│                                          │
│     #                #                   │
│  mmm#   mmm    mmm   #   m   mmm    m mm │
│ #" "#  #" "#  #"  "  # m"   #"  #   #"  "│
│ #   #  #   #  #      #"#    #""""   #    │
│ "#m##  "#m#"  "#mm"  #  "m  "#mm"   #    │
│                                          │
│                                          │
└──────────────────────────────────────────┘
```

Produces the above output (yours will be in color!).

#### Checker

You can check your `Dockerfile` using the provided automatic checker script:

```shell
bash check.sh --exercise1
```

If the checker does not produce any errors, you have completed the exercise.

---

### Optional Extras

These are optional and suggested for you to explore some of the intricacies of writing Dockerfiles.

If you really want to write a great Dockerfile, consider the following:

- Minimize the number of layers, The minimum number of layers possible to write this image is 4.
- Minimize the image size, if you clear the apt cache, and remove the apt list files, your image should be less than 100mb.
- Use `hadolint` ([Haskell Dockerfile linter](https://github.com/hadolint/hadolint)) to check your image for best practices, like pinning the base image, using specific versions when installing with `apt-get`.
  - You can check your `Dockerfile` by running `hadolint` in a docker container:
  - `$ docker run --rm -it hadolint/hadolint < exercise1/Dockerfile`.

## 2. Optimize an existing Dockerfile

In this exercise we will be optimizing an existing Dockerfile in order to reduce it's size and number of layers.

The Dockerfile is located in `exercise2/Dockerfile`.

The Dockerfile downloads a [git repository](https://github.com/eficode-academy/devops-academy-whale/) which contains a single file `whale.txt`, which contains ASCII art of a whale.

The image then uses the essential tool `lolcat` to colorize the ASCII whale, producing a file `color_whale.txt`, which contains the ASCII art and terminal color codes.

The `ENTRYPOINT` of the Dockerfile uses `cat` to print the colored whale to the terminal.

The initial Dockerfile is purposefully written to have as many layers and redundant commands as possible, which also means that even though the Dockerfile deletes all of the tools and temporary files, they are included in the final image, as they are saved in the seperate layers that make up the image.

Therefore you must shrink the number of layers in order to reduce the size of the resulting docker image, but do so without changing any of the functionality of the docker image.

### Tasks:

Optimize the Dockerfile to reduce its size and number of layers:

- The Dockerfile must only contain a single `RUN` instruction.
- The Dockerfile must be valid, it must be able to build an image.
- The Dockerfile must produce the same output as the initial Dockerfile.
- The final docker image must be less than 100MB (My solution is 79.8MB).

Your solution must be in the file `devops-academy-handins-public/docker/exercise2/Dockerfile`.

#### Checker

You can use the included checker script to check your `exercise2/Dockerfile` file:

```shell
$ bash check.sh --exercise2
```

When the script runs without any errors, you have solved the exercise.

## 3. Wordpress with Reverse Proxy using docker-compose

In this exercise we will create a declarative multi-container setup using `docker-compose`.

The application we will use is `wordpress`, which consists of the wordpress application itself and a `mysql` database, so two containers.

We will run wordpress behind a reverse proxy, for this we will use `nginx`.

The wordpress "stack" will thus be **three containers total.**

In the [Compose file reference](https://docs.docker.com/compose/compose-file/compose-file-v3/#compose-file-structure-and-examples) you can look up how to configure all of the different parameters.

### Tasks:

**You must use the template provided: `exercise3/docker-compose.yaml`, if you do not use the template your hand-in will not be graded!**

Write a `docker-compose.yaml` declarative specification:

- Define three services: (in docker-compose a `service` represents a container to be run)
  - `reverse-proxy-nginx`
    - Use the provided Dockerfile `exercise3/Dockerfile` to build an nginx image with the provided nginx config file `exercise3/nginx.conf`
      - Use a `build` argument in the service, which specifies the `context` and `dockerfile` to use.
      - [Relevant Docs](https://docs.docker.com/compose/compose-file/compose-file-v3/#build)
    - Must port-forward host port 80 to container port 80
    - The container name must be `nginx`
    - You can check that the image builds with the command: `$ docker-compose build`
  - `wordpress`
    - Use the official [wordpress docker image](https://hub.docker.com/_/wordpress) with the `5.7.2-apache` tag.
    - Configure the environment variables to connect to the database.
      - You can find the relevant environment variables that you must configure on the [docker hub page](https://hub.docker.com/_/wordpress).
    - The container must not port-forward any ports
    - The container name must be `wordpress`
  - `db`
    - Use the official [mysql docker image](https://hub.docker.com/_/mysql) with the `5.7` tag.
    - Configure environment variables to create an initial database and set user credentials.
      - You can find all of the environment variables that you must configure on the [docker hub page](https://hub.docker.com/_/mysql).
    - The container name must be `db`

When you have defined all of the services, try to start your wordpress stack with the command `$ docker-compose up -d`.
When you are satisfied that your wordpress setup works correctly, stop the stack with the command `$ docker-compose down -v`.

#### Checker

You can use the included checker script to check your `docker-compose.yaml` file:

```shell
$ bash check.sh --exercise3
```

When the script runs without any errors, you have solved the exercise.

### Optional Extras

These are some suggestions for writing the best possible docker-compose file, but is not part of what is grated.

If you want to write the best possible docker-compose file consider the following:

- Networking:
  - In the default configuration when you start a docker-compose stack, docker will create a default docker network for you, and attach all of your defined services.
  - This is fine for simple setups, but if you want to limit the access to your different services, then you can explicitly create multiple networks and attach specific services to them.
  - You could for example create a network that only the nginx and wordpress instances are connected to, and a database network that only the wordpress and the mysql instances are connected to.
- Persistent Storage
  - Since containers are ephemeral, whenever you restart your containers, they will start from the same immutable starting point.
  - Thus in order persist data from your mysql and wordpress instances, you must store it outside the container.
  - To do this you should use `named volumes` defined in your docker-compose file.
  - You should create two distinct volumes for wordpress and mysql respectively, and mount them to the appropriate path.
    - Look at the docker hub pages for the path to mount the volumes.
  - The neat thing about defining named volumes in your docker-compose file, is that it will work wherever you want to deploy it, without having to manage the volumes manually, or setting up host paths for bindmounts.
