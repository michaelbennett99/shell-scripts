#!/usr/bin/env bash

USER="michaelbennett99"

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <directory ssh url>"
    exit 1
fi

# Clone git repository
echo "Cloning repository $1"
git clone $1

# Get directory name
filename=$(basename $1)
name=${filename%%.*}

echo $filename
echo $name

echo "Creating repository $name for user $USER"
gh repo create $name --private

# Move into repository
cd $name

# Get the name of the main branch
branch=$(git branch --show-current)

# If the main branch is not main, change it to main
if [[ $branch != "main" ]]; then
    echo "Changing main branch to main"
    git branch -m $branch main
fi

# Set up the remote url and push
echo "Setting up repository $name for user $USER"
git remote set-url origin "git@github.com:$USER/$name.git"

git push -u origin main
