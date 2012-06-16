#!/bin/bash

DIFFTMP=$TMP/gitdiff
rm -rf $DIFFTMP
mkdir $DIFFTMP

git difftool --no-prompt -x difflist_helper.sh $LOCAL $REMOTE

cat $DIFFTMP/filelist.txt
"C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\x64\WinDiff.Exe" -I $DIFFTMP/filelist.txt