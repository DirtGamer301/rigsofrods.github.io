#!/bin/bash
FILES=$(find content/source -printf "%P\n" | grep .adoc)

for file in $FILES
do
  basepath=$(echo $file | sed "s|.adoc||")
  translated_adoc="$basepath.en.adoc"

  echo "Generating source/localizable/$translated_adoc from content/source/$basepath.adoc"
  install -D content/source/$file source/localizable/$translated_adoc
done
