#!/bin/sh
mkdir ./public-git
cd ./public-git
git init
git config --global push.default matching
git config --global user.email "${GITHUB_EMAIL}"
git config --global user.name "${GITHUB_USER}"
git remote add origin https://${GITHUB_TOKEN}@github.com/theme-suka/theme-suka.github.io.git
git pull origin master
rm -rf ./*
cp -rf ../public/* ./
git add --all .
DATE="$(echo $(date --rfc-2822))"
git commit -m "Site Updated: $DATE"
git push --quiet --force origin HEAD:master
