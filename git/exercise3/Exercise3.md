# Exercise 3

In this exercise you will be creating a linear history of commits.

## Scenario

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

## Tasks

- Change the history of the `master` and `feature` branches to match the one above.
- Make sure that `feature` has a linear history.
- Then make sure that the work on feature is also delivered back in to `master` branch.
