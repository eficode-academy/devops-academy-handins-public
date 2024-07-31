# Exercise 6

In this scenario we will be working with a remote repository.

## Scenario

You are working in a team where you just committed your first commit to the remote repository.
All is fine and dandy, until the CI server throws up with an army of errors, and you have no clue on what caused this eruption.
You need to undo your changes and let the rest of the team commit their work, while you sit back and figure out what went wrong.

## Tasks

- Return the `main` branch to a workable state, by excluding the changes made in commit `0606c93735ef8ec65c53fa64b3529af83b19ed32`.
  This is a repository that other people are working on, and therefore you are not allowed to rewrite the history, only add to it.
- If git suggests a commit message, use the one git suggests.

:bulb: you cannot commit to the remote (because this is a static repository used for this exercise), so your task is to change your local `main` branch to the correct state (in the real world you would then push your branch).
