#!/bin/bash

# $1: old maildir
# $2: new maildir

# get working directory
wd=$(pwd)

# prepend working directory to path
oldfile=$wd/$1

# extract date
date=$(cat $oldfile | \
    sed -En "s/^Date: (.*)/\1/p" | \
    sed -En "s/^\s*(.*)/\1/p" | \
    sed "s/<.*$//g" | \
    sed "s/\&.*$//g" | \
    sed "s/To.*$//" | \
    sed "s/From.*//" | \
    sed "s/<.*//g")

# parse date
date=$(echo $date | ./parse_date.py)

# create new path
newfile=$(pwd)/$2/.$date/cur/$(basename $1)

# move, keep attributes
cp -a $oldfile $newfile
