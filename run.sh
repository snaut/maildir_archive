#!/bin/bash

# $1: original maildir
# $2: new maildir
oldmaildir=$1
newmaildir=$2

# find years in which there are messages
./extract_all_dates.sh $oldmaildir |\
    sort |\
    uniq |\
    iconv -f utf8 -t utf8 -c |\
    ./parse_year.py |\
    sort |\
    uniq > all_years_unique.txt

# make the new base maildir
maildirmake $newmaildir

# make subfolders for each month in each year where there are messages
for i in $(cat all_years_unique.txt); do
    maildirmake -f $i $newmaildir
    for j in $(seq 1 12); do
        j=$(printf "%02d\n" $j)
        maildirmake -f $i.$j $newmaildir
    done
done

# copy messages to new location
find $oldmaildir -type f -exec ./copy_to_subdir.sh {} $2  \;

# remove temporary file
rm all_years_unique.txt
