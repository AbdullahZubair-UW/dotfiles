#!/bin/sh

# Updates waterloo repo
# git -C ~/uwaterloo/ ss

# Cleans all latex junk files (.log,.aux,...) in current semester at UW
find ~/uwaterloo -maxdepth 4 -type d \( ! -name . \) -exec bash -c "cd '{}' && latexmk -c" \;

