#!/bin/bash
NEW_LINGUAS=$1
FOLDERS=$2
TMPDIR="/tmp/locale_temp"

for lang in $NEW_LINGUAS
do
  for folder in $FOLDERS
  do
    mkdir -p $folder/po/$lang
    mkdir -p $TMPDIR
    echo ""
    cp -r $folder/pot/* $TMPDIR
    
    FILES=$(find $TMPDIR -printf "%P\n" | grep .pot)
    for file in $FILES
    do
      basepath=$(echo $file | sed "s|.pot||")
      if !([ -r $folder/po/$lang/$basepath.po ])
      then
        echo "Moving file $basepath.pot to $basepath.po"
        install -Dm644 $TMPDIR/$basepath.pot $folder/po/$lang/$basepath.po
      fi
    done
    rm -rf $TMPDIR
  done
done
