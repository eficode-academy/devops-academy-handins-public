#!/usr/bin/env bash
rm -rf exercise
mkdir exercise
cd exercise
git init

touch greeting.txt
git add greeting.txt
git commit -m "Add file greeting.txt"
echo "hello" >greeting.txt
git add greeting.txt
git commit -m "Add content to greeting.txt"
# Go to uppercase on a branch
git checkout -b feature
echo "HELLO" >greeting.txt
git commit -am "Change greeting to uppercase"
# Move forward on master
git checkout master
echo "Greetings library" >README.md
git add README.md
git commit -m "Add readme"
