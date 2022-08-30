#!/bin/bash

if [ "$1" == "" ]; then
  git tag
  exit 0
fi

msg="Changes unrelated to a JIRA task"

if [ "$2" != "" ]; then
  msg=$2
fi

branch=$(git branch | grep \* | cut -d ' ' -f2)

git pull origin $branch
git add .
git commit -m "$msg"
git push origin $branch

git tag $1
git push origin $1
