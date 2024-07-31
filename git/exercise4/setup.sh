#!/usr/bin/env bash
rm -rf exercise
mkdir exercise
cd exercise
git init
touch .gitignore
echo "bfile.txt" >.gitignore

touch afile.txt
echo "first commit" >afile.txt
git add afile.txt
git add .gitignore
git commit -m "first commit"
echo "second (bad) commit" >>afile.txt
git add afile.txt
git commit -m "Add bad content to afile.txt"
echo "a uncommitted change" >>afile.txt
git add afile.txt
echo "a sandbox change" >>afile.txt
echo "another file" >bfile.txt
