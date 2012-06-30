#!/bin/bash

# this is called once per file in the commit.
# sample output might be:
#
# To see diffs in commit 343e848fe7b0:
#
#    $ git difftool --no-prompt -x echo 343e848fe7b0^!
#    C:/Users/Alex/AppData/Local/Temp/JP1qjc_README /dev/null
#    /dev/null README.md
#
# Another example:
#
#    $ git difftool -x echo -y 4a2aed^!
#    C:/Users/Alex/AppData/Local/Temp/4Hq6Wd_quadrics.h C:/Users/Alex/AppData/Local/Temp/kyhWJd_quadrics.h
#    C:/Users/Alex/AppData/Local/Temp/8P1nXd_reyes.cpp C:/Users/Alex/AppData/Local/Temp/oGSdKd_reyes.cpp
#    C:/Users/Alex/AppData/Local/Temp/aVlFXd_reyes.h C:/Users/Alex/AppData/Local/Temp/oW4fge_reyes.h
#    C:/Users/Alex/AppData/Local/Temp/uTNMKd_stochastic.cpp C:/Users/Alex/AppData/Local/Temp/IUwn3d_stochastic.cpp
#    C:/Users/Alex/AppData/Local/Temp/Eae5Kd_stochastic.h C:/Users/Alex/AppData/Local/Temp/mHrvGd_stochastic.h
#
# temp directory for storing diffs.
#
DIFFTMP=$TMP/gitdiff

# $BASE has the relative pathname of the file being compared.
#

# $1 is a temp file containing the pre-image,
# $2 is a file containing the post-image (may be temp or not)
# also, either file could be '/dev/null' if it's a new or deleted file.
#

if [ $1 == '/dev/null' ]
then  # this is a newly introduced file.
	mkdir -p $DIFFTMP/`dirname $BASE`
	cp $2 "$DIFFTMP/${BASE}_created"
	echo "$LOCALAPPDATA/temp/gitdiff/${BASE}_created" >> $DIFFTMP/filelist.txt
elif [ $2 == '/dev/null' ]
then  # this is a deleted file.
	mkdir -p $DIFFTMP/`dirname $BASE`
	cp $1 "$DIFFTMP/${BASE}_deleted"
	echo "$LOCALAPPDATA/temp/gitdiff/${BASE}_deleted" >> $DIFFTMP/filelist.txt
else
	mkdir -p $DIFFTMP/pre/`dirname $BASE`
	mkdir -p $DIFFTMP/post/`dirname $BASE`
	
	cp $1 "$DIFFTMP/pre/$BASE"
	cp $2 "$DIFFTMP/post/$BASE"
	echo "$LOCALAPPDATA/temp/gitdiff/pre/$BASE" "$LOCALAPPDATA/temp/gitdiff/post/$BASE" >> $DIFFTMP/filelist.txt
fi
