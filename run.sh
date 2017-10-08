#!/bin/bash

# download binary extensions
curl -s https://raw.githubusercontent.com/sindresorhus/binary-extensions/master/binary-extensions.json | sed 's/[],,",\,\t\[]//g' > binaries
extensions=($(find . -type f | egrep -i -E -o '\w*$' | sort -su))

# check tracked files
if [[ -f repo/.gitattributes ]]; then
  cut -d ' ' -f1 repo/.gitattributes | sed 's/^\*\.//g' > tracked
else
  touch tracked
fi

file=binaries
lfs=tracked
# loop all extensions
for i in ${extensions[@]}; do
  if grep -Fxq $i "$lfs"; then
    continue
  fi
  if grep -Fxq $i "$file"; then
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