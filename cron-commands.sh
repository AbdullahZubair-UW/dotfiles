#!/bin/sh

# Updates config files
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME su

# Updates all git repos (update command is in git alias's)
git update

# Updates uwaterloo dir at Docs
rsync -avzu --delete -h --exclude='.git/' ~/uwaterloo/ ~/Documents/uwaterloo-backup/

