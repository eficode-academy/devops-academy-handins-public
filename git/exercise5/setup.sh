#!/usr/bin/env bash

rm -rf exercise
mkdir exercise
cd exercise || exit
git init
git config --local advice.detachedHead false

touch file1
git add file1
git commit -am "A"

touch file2
git add file2
git commit -am "B"

touch file3
git add file3
git commit -am "C"

touch file4
git add file4
git commit -am "D"

git checkout HEAD~3

touch file5
git add file5
git commit -am "E"

git rebase master

git tag E

git checkout master
