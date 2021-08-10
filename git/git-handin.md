# git Hand-in

Welcome to the `git` hand-in!

In this hand-in you will solve 5 different exercises about different git problems.

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

This will produce a file named `git-<your-email>.zip` which is what you hand in.

**If you submit your hand-in any other way, it will not be graded!**

---

# Exercise 1

In this exercise you will be cleaning up the commit history of a branch.

### Scenario:

The master branch contains a number of work-in-progress commits, made by a developer who just had to save some work in a hurry while working on a feature.

In order to make a commit history that is suitable for others to read, you must clean it up.

### Tasks:

- Squash the five newest commits into one.
- The squashed commit must have exactly the commit message "close #321".
- The branch should only contain two commits: the initial commit and your squashed commit.

# Exercise 2

In this exercise you will make sure that work is saved to specific branches.

### Scenario:

You are developing a new feature on the branch `feature`.

You have already implemented the first part of the feature, and committed it to the branch, when you are notified that you have to fix a critical bug on `master` branch.

You fix the bug on `master`. The bugfix is stored in a commit on `master` branch.

Then you continue your work on the new feature, but realize that you did not switch back to the `feature` branch when you implemented the second part of the feature, which you have now commited to `master` branch.

### Tasks:

- The second part feature commit and the bugfix commit currently on the `master` branch must also be present on the `feature` branch.
- The `feature` branch should contain at least four commits: the initial commit, the feature first part, the feature second part and the bugfix.
- Remove the second part feature commit from the `master` branch, so that it only contains the initial commit and the bugfix commit.

# Exercise 3

In this exercise you will be creating a linear history of commits.

### Scenario:

You have developed a new feature on a feature branch:

```bash
* 1f37b43 (HEAD -> master) Add readme
| * a824913 (feature) Change greeting to uppercase
|/
* b84f28f Add content to greeting.txt
* efb74a6 Add file greeting.txt
```

You now want to "deliver" your feature to the master branch, but instead of just merging the commit into master,
you like a straight line of commits like the example below:

```bash
$ git log --oneline --graph --decorate --all
* 185d944 (HEAD -> master, feature) Change greeting to uppercase
* 7de840f Add readme
* f9bd67b Add content to greeting.txt
* 4de1606 Add file greeting.txt
```

### Tasks:

- Change the history of the `master` and `feature` branches to match the one above.
- Make sure that `feature` has a linear history.
- Then make sure that the work on feature is also delivered back in to `master` branch.

# Exercise 4

In this exercise you will be cleaning up a git repository, removing work-in-progress and removing a bad commit.

### Scenario:

You have been experimenting with some new changes.

Ultimately you decide that your experiment doesn't work, and you want to go back to the state from before you started experimenting.

But you are left with some work-in-progress files as well as a commit that you don't want to keep.

### Tasks:

- Remove the unstaged changes
- Remove the staged changes
- Make `master` go back to the commit before the bad commit
- Make git track bfile.txt and make a commit that adds the file
- You should have either 2 or 4 commits on `master` branch when you are done

# Exercise 5

In this exercise you will be exploring the history of a git repository, creating branches from past commits, and commits that are not visible in the commit log.

### Scenario:

You want to preserve some previous work on a branch, so that you can easily check it out.

Further you have a commit that has been lost to the git log in a rebase, though you did tag the commit with the message `e`. You want to continue to work on the commit, so you want to create a branch on this commit.

### Tasks:

- Make a branch called `the-beginning` that is made from the first commit with message `A`
- Find the dangling commit with the message `E`, and create a branch from that commit called `dangling`. To make your life easier, we have tagged this commit with a tag called `E`.

#### Bonus (not graded)

How would you find a commit that is not in the commit log, and does not have any tag associated with it?
