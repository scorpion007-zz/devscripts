#!/bin/sh

# Passing the following parameters to mergetool:
#  local base remote merge_result

alocal=$1
base=$2
remote=$3
result=$4

if [ -f $base ]
then
    #"C:/Program Files/SourceGear/DiffMerge/DiffMerge.exe" "$alocal" "$base" "$remote" -m --result="$result" --title1="Mine" --title2="Merging to: $result" --title3="Theirs"

    # for merge respecting eol, KDiff3 is better than DiffMerge (which will always convert LF into CRLF)
    # KDiff3 will display eol choices (if Windows: CRLF, if Unix LF)
    "$PROGRAMFILES/KDiff3/kdiff3.exe" -m "$base" "$alocal" "$remote" -o "$result"
else
    #there is not always a common ancestor: DiffMerge needing 3 files, BASE will be the result
    #"C:/Program Files/SourceGear/DiffMerge/DiffMerge.exe" "$alocal" "$result" "$remote" -m --result="$result" --title1="Mine" --title2="Merging to: $result" --title3="Theirs"

    # KDiff3 however does know how to merge based on 2 files (not just 3)
    "$PROGRAMFILES/KDiff3/kdiff3.exe" -m "$base" "$remote" -o "$result"
fi