#!/bin/bash

DIFFTMP=$TMP/gitdiff

mkdir -p $DIFFTMP/`dirname $2`
cp $1 "$DIFFTMP/$2"
echo "$LOCALAPPDATA/temp/gitdiff/$2" "$2" >> $DIFFTMP/filelist.txt

