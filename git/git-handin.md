# git Hand-in

Welcome to the `git` hand-in!

In this hand-in you will solve 7 different exercises about different git problems.

The exercises can be solved in multiple different ways, all solutions that lead to the desired state are correct.

## Setup and how to solve the exercises

First of all you must put your **SDU email address** in to the `git/student.txt` file.
This is used to match your hand-in back to you.

All hand-in files are located in the `devops-academy-handins-public/git` directory.

Each exercise is located in the sub-directories: `exercise1..n`.

Each exercise contains a `setup.sh` script that will initialize a local git repository for the exercise, as well as modify this repository in order to create the conditions of the exercise.

Each of the exercise specific repositories will be placed in a directory named `exercise` located in each of the `exercise1..n` directories, e.g. `exercise1/exercise`.

You start each of the exercises by changing directory to the exercise specific directory, e.g. `cd exercise1` and then running the setup script: `source setup.sh`
(You can also run the script `./setup.sh`, but using `source` will also move you to the created repository.)

Your task is then to get the exercise-specific git repository to the desired state as explained in each of the exercises.

After solving the exercises you will be handing the actual git repositories with the changes you have made.

## Checker

Grading of your hand-in will be done programmatically based upon the state of the git repositories belonging to each exercise.

You can use the same checker program that will be used to grade your hand-in to check that your solution is correct.

Each of the hand-ins will have a `check.sh` script that will run a docker container, which will run the checker program, and tell you how many points you have achieved for each of the exercises.

The script is located in `devops-academy-handins-public/git/check.sh`.

You use the checker by calling the script `bash check.sh --exercise1` to check exercise 1, use `--exercise2` for exercise 2, and so on.
`--all` will check all exercises and give you an overall score.

You don't have to call the script from the same directory that it is located in, if you are working on exercise1 and want to check your solution, i.e. you are on the path `devops-academy-handins-public/git/exercise1/exercise`.
Then you can point to the script like so:

```sh
bash ../../check.sh --exercise1
```

## Submitting the Hand-in

When you are ready to submit your hand-in, use the `zip.sh` script in the `git` directory to create a zip file that has the structure that the automatic checker expects.

Run the script with:

```sh
bash zip.sh
```

This will produce a file named `git-<your-email>.zip` which is what you hand in. (E.g. `git-dummy@sdu.dk.zip`)

**If you submit your hand-in any other way, it will not be graded!**

---

## Exercises

* [Exercise 1](exercise1/Exercise1.md)
* [Exercise 2](exercise2/Exercise2.md)
* [Exercise 3](exercise3/Exercise3.md)
* [Exercise 4](exercise4/Exercise4.md)
* [Exercise 5](exercise5/Exercise5.md)
* [Exercise 6](exercise6/Exercise6.md)
* [Exercise 7](exercise7/Exercise7.md)

### Bonus task (not graded)

How would you find a commit that is not in the commit log, and does not have any tag associated with it?
