# Exercise 5

In this exercise you will be exploring the history of a git repository, creating branches from past commits, and commits that are not visible in the commit log.

## Scenario

You want to preserve some previous work on a branch, so that you can easily check it out.

Further you have a commit that has been lost to the git log in a rebase, though you did tag the commit with the message `e`. You want to continue to work on the commit, so you want to create a branch on this commit.

## Tasks

- Make a branch called `the-beginning` that is made from the first commit with message `A`
- Find the dangling commit with the message `E`, and create a branch from that commit called `dangling`. To make your life easier, we have tagged this commit with a tag called `E`.
