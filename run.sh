#!/bin/bash

# get tracked files
if [[ -f repo/.gitattributes ]]; then
  cut -d ' ' -f1 repo/.gitattributes | sed 's/^\*\.//g' > tracked
else
  touch tracked
fi

# loop all extensions
for i in $(find . -type f | egrep -i -E -o '\w*$' | sort -su); do
  if grep -Fxq $i tracked; then
    continue
  fi
  if grep -Fxq $i binaries; then
    error=1
    echo $i 1>&2
  fi
done

# set exit code
if [[ $error ]]; then
  exit 1
else
  exit 0
fi