#!/usr/bin/env bash

#!/usr/bin/env bash

rm -rf exercise
git clone https://github.com/eficode-academy/devops-academy-remote-ex.git exercise
cd exercise
git reset --hard HEAD~1

git checkout -b feature/database-connection
touch file1
git add file1
git commit -am "ADD file1"

touch file2
git add file2
git commit -am "ADD file2"

touch file3
git add file3
git commit -am "ADD file3"