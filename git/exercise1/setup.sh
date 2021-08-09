#!/usr/bin/env bash

rm -rf exercise
mkdir exercise
cd exercise
git init

touch alsoafile.txt

git add alsoafile.txt
git commit -m "initial file"

echo "This is a relevant fact" >file.txt

git add file.txt

git commit -m "Working on 321"

echo "This is also relevant" >>file.txt

git commit -am "Add more relevancy"

echo "Perhaps this is the most relevant" >>file.txt

git commit -am "most relevant!"

echo "This is the prime directive" >>file.txt

git commit -am "add prime directive to 321"

echo "NEVER change public history" >>file.txt

git commit -am "add the word, and done with 321"
