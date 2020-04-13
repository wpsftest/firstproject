#!/bin/bash
set -e

# Required params
token=$1
email=$2
username=$3

cd ..
mkdir gitwork
cd gitwork
git clone git@github.com:wpsftest/forked-firstproject.git
cd forked-firstproject/
git remote -v
git remote add upstream git@github.com:rguuduru/firstproject.git
git fetch upstream
git checkout master
git merge upstream/master
echo "about to do branch and checking out branch"
git checkout -b new_branch
echo "asetting configs"
git config credential.helper 'cache --timeout=1200000'
git config --global user.email "$email"
git config --global user.name "$username"
echo "beforepush things to forked branch"
git remote -v
git push origin new_branch --force > /dev/null
echo "completed pushing things"
