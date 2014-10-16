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
    # for every md file in the input directory
    for file in `ls -d -1 $1/* | egrep "\.md"`
     do
       # replace .md with .html
       html_name=`echo $file | egrep -io "[a-zA-Z0-9\_\-]*\.md" | sed -e "s/\.md/\.html/g"`
       # set $output to "output/dir/file.html"
       output=$2/$html_name
       echo "  input: $file"
       # run markdown against the file, swap the html conversion of ```lang to its appropriate form
       # this is the monkey patch that facilitates hljs
       markdown $file \
         | sed -e "s/<p><code>\(\w\+\)/<pre><code class=\"\1\">/" \
         | sed -e "s/<\/code><\/p>/<\/code><\/pre>/" \
         > temp.html
       # prepend header
       cat header.html temp.html > temp2.html
       # append footer and output
       cat temp2.html footer.html > $output
       echo "created: $output"
       # clean up
       rm temp.html
       rm temp2.html
     done
  fi
fi
