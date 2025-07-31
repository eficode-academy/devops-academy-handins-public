# Docker Hand-in

Welcome to the docker hand-in!

In this hand-in you will solve three different exercises, that deal with writing Dockerfiles, optimizing Dockerfiles and creating a multi-container stack with docker-compose.

## Automatic Checker

First of all you must put your **SDU email address** in to the `docker/student.txt` file.
This is used to match your hand-in back to you.

Each exercise has files associated with it that you must modify, these are located in their respective sub directories of the docker directory, e.g. `devops-academy-handins-public/docker/exercise1`.

**If you do not use the template, your hand-in will not be graded!**

In the `devops-academy-handins-public/docker` directory you will find the `check.sh` script which you can use to check the correctness of your submission.

You use the checker by calling the script `bash check.sh --exercise1` to check exercise 1, use `--exercise2` for exercise 2, and so on.
`--all` will check all exercises and give you an overall score.

After solving the exercises you will be submitting the Dockerfiles and docker-compose.yaml files that you have modified.

## Submitting the Hand-in

When you are ready to submit your hand-in, use the `zip.sh` script in the `docker` directory to create a zip file that has the structure that the automatic checker expects.

Run the script with:

```sh
bash zip.sh
```

This will produce a file named `git-<your-email>.zip` which is what you hand in.

**If you submit your hand-in any other way, it will not be graded!**

---

* [Exercise 1](exercise1/Exercise1.md)
* [Exercise 2](exercise2/Exercise2.md)
* [Exercise 3](exercise3/Exercise3.md)
