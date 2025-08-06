# Exercise 2

In this exercise you will make sure that work is saved to specific branches.

## Scenario

You are developing a new feature on the branch `feature`.

You have already implemented the first part of the feature, and committed it to the branch, when you are notified that you have to fix a critical bug on `master` branch.

You fixed the bug on `master`. The bugfix is stored in a commit on the `master` branch.

Then you continue your work on the new feature, but realize afterwards that you forgot to switch back to the `feature` branch before commiting the second part of the feature, so this change is now on the `master` branch.

## Tasks

- The second part feature commit and the bugfix commit currently on the `master` branch must also be present on the `feature` branch.
- The `feature` branch should contain exactly four commits: the initial commit, the feature first part, the feature second part and the bugfix. As with real code, order is important. Make sure that the the two parts of the feature end up in the "sane" order in the final file.
- Remove the second part feature commit from the `master` branch, so that it only contains the initial commit and the bugfix commit.
