#!/bin/bash

msg="changes"

if [ "$1" != "" ]; then
  msg=$1
fi

branch=$(git branch | grep \* | cut -d ' ' -f2)

git pull origin $branch
git add .
git commit -m "$msg"
git push origin $branch
