#!/bin/bash

# this script turns markdown files from input 1 directory into html at input 2

if [ -z "$1" ]
  then
    echo "need input directory"
else
  if [ -z "$2" ]
    then
      echo "need output directory"
  else
    for file in `ls -d -1 $1/* | egrep "\.md"`
     do
       html_name=`echo $file | egrep -io "[a-zA-Z0-9\_\-]*\.md" | sed -e "s/md/html/g"`
       output=$2/$html_name
       markdown $file | sed -e "s/<p><code>\(\w\+\)/<pre><code class=\"\1\">/" | sed -e "s/<\/code><\/p>/<\/code><\/pre>/" > temp.html
       cat header.html temp.html > temp2.html
       cat temp2.html footer.html > $output
       rm temp.html
       rm temp2.html
     done
  fi
fi
