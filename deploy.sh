#!/bin/sh
mkdir ./public-git
cd ./public-git
git init
git config --global push.default matching
git config --global user.email "isukkaw@gmail.com"
git config --global user.name "SukkaW"
git remote add origin https://${GitHubKEY}@github.com/theme-suka/theme-suka.github.io.git
git pull origin master
rm -rf ./*
cp -rf ../public/* ./
git add --all .
DATE="$(echo $(date --rfc-2822))"
git commit -m "Site Updated: $DATE"
git push --quiet --force origin HEAD:master
