#!/bin/sh

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME su
git update
rsync -avzu --delete -h --exclude='.git/' ~/uwaterloo/ ~/Documents/uwaterloo-backup/
