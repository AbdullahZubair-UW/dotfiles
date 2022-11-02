#!/bin/sh

# Updates config files
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME su

# Updates all git repos (update command is in git alias's)
git update

# Cleans all latex junk files (.log,.aux,...) in current semester at UW
find ~/uwaterloo/UW-4A -maxdepth 3 -type d \( ! -name . \) -exec bash -c "cd '{}' && latexmk -c" \;

# Updates uwaterloo dir at Docs
rsync -avzu --delete -h --exclude='.git/' ~/uwaterloo/ ~/Documents/uwaterloo-backup/

