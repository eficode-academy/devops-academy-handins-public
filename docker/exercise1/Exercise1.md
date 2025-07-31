# Exercise 1: The multi-color TOIlet

The `TOIlet` (... or “The Other Implementation’s letters”, a free software implementation of `figlet`) application is a Linux CLI utility that takes an input string and produces ASCII art letters of the string, and optionally applies effects.

The first exercise is to write a `Dockerfile` which contains the `toilet` application, and can be used to generate colorful ASCII text art.

See [TOIlet's website](http://caca.zoy.org/wiki/toilet) for more info.

## Tasks

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

## Checker

You can check your `Dockerfile` using the provided automatic checker script:

```shell
bash check.sh --exercise1
```

If the checker does not produce any errors, you have completed the exercise.

---

## Optional Extras

These are optional and suggested for you to explore some of the intricacies of writing Dockerfiles.

If you really want to write a great Dockerfile, consider the following:

- Minimize the number of layers, The minimum number of layers possible to write this image is 4.
- Minimize the image size, if you clear the apt cache, and remove the apt list files, your image should be less than 100mb.
- Use `hadolint` ([Haskell Dockerfile linter](https://github.com/hadolint/hadolint)) to check your image for best practices, like pinning the base image, using specific versions when installing with `apt-get`.
  - You can check your `Dockerfile` by running `hadolint` in a docker container:
  - `$ docker run --rm -i hadolint/hadolint < exercise1/Dockerfile`.
