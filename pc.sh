#!/bin/bash
set -e
if [ -z "$1" ]; then
  echo "usage: ./pc.sh [filename.cpp]"
  exit 1
fi
if ! [ -f "$1" ]; then
  echo "$1 does not exist"
  exit 1
fi

file_name=`basename -s .cpp $1`
cat << EOF | pandoc -f markdown -o "$file_name.pdf" --latex-engine=lualatex
---
documentclass: ltjarticle
monofont: "M+ 1m"
---

# $1

~~~ {.cpp .numberLines}
$(cat "$1")
~~~
EOF
