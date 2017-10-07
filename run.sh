#!/bin/bash

# download binary extensions
curl -s https://raw.githubusercontent.com/sindresorhus/binary-extensions/master/binary-extensions.json | sed 's/[],,",\,\t\[]//g' > binaries
extensions=($(find . -type f | egrep -i -E -o '\w*$' | sort -su))

# check tracked files
if [ -f .gitattributes ]
then
  cut -d ' ' -f1 .gitattributes | sed 's/^\*\.//g' > tracked
else
  touch tracked
fi

FILE=binaries
TRACKED=tracked

# loop all extensions
for i in ${extensions[@]}
do
  if grep -Fxq $i "$TRACKED"; then
    continue
  fi
  if grep -Fxq $i "$FILE"; then
    >&2 echo $i
  fi
done
