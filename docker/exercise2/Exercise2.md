# Exercise 2: Optimize the color-whale Dockerfile

In this exercise we will be optimizing an existing Dockerfile in order to reduce it's size and number of layers.

The Dockerfile is located in `exercise2/Dockerfile`.

The Dockerfile downloads a [git repository](https://github.com/eficode-academy/devops-academy-whale/) which contains a single file `whale.txt`, which contains ASCII art of a whale.

The image then uses the essential tool `lolcat` to colorize the ASCII whale, producing a file `color_whale.txt`, which contains the ASCII art and terminal color codes.

The `ENTRYPOINT` of the Dockerfile uses `cat` to print the colored whale to the terminal.

The initial Dockerfile is purposefully written to have as many layers and redundant commands as possible, which also means that even though the Dockerfile deletes all of the tools and temporary files, they are included in the final image, as they are saved in the seperate layers that make up the image.

Therefore you must shrink the number of layers in order to reduce the size of the resulting docker image, but do so without changing any of the functionality of the docker image.

## Tasks

(Before starting the exercise it might be a good idea to copy the template Dockerfile, if you need to refer back to the original one, you can also always use git to restore the original one.)

Optimize the Dockerfile to reduce its size and number of layers:

- The Dockerfile must only contain a single `RUN` instruction.
- The Dockerfile must be valid, it must be able to build an image.
- The Dockerfile must produce the same output as the initial Dockerfile.
- The final docker image must be less than 100MB (My solution is 79.8MB).

Your solution must be in the file `devops-academy-handins-public/docker/exercise2/Dockerfile`.

### Checker

You can use the included checker script to check your `exercise2/Dockerfile` file:

```shell
bash check.sh --exercise2
```

When the script runs without any errors, you have solved the exercise.
