#!/bin/bash

repo=$1
org=${PWD##*/}

dir="$(dirname "$(pwd)")"
provider=${dir##*/}

echo "Provider: $provider"
echo "Organization: $org"
echo "Repository: $repo"

if [ -z "$repo" ];
then
  echo "Repository name is required!"
  exit 1
fi

if [ -z "$provider" ];
then
  echo "No provider detected!"
  exit 1
fi

git clone git@$provider:$org/$repo.git
