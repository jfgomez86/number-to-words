#!/bin/bash
FILES=`ls *.haml`
for file in $FILES 
do
  new_name=`echo "$file" | sed -e 's/haml/erb/g'`
  haml $file > $new_name
done
