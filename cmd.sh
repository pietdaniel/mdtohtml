#!/bin/bash

# this script turns markdown files into html

if [ -z "$1" ]
  then
    echo "no arguments"
else
  markdown $1 | sed -e "s/<p><code>\(\w\+\)/<pre><code class=\"\1\">/" | sed -e "s/<\/code><\/p>/<\/code><\/pre>/" > temp.html
  cat header.html temp.html > output.html
  rm temp.html
fi
