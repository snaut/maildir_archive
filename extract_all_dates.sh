#!/bin/bash

# extract all lines beginning with Date, do some cleaning up
for i in $(ls $1/cur); do
    cat $1/cur/$i | \
    sed -En "s/^Date: (.*)/\1/p" | \
    sed -En "s/^\s*(.*)/\1/p" | \
    sed "s/<.*$//g" | \
    sed "s/\&.*$//g" | \
    sed "s/To.*$//" | \
    sed "s/From.*//" | \
    sed "s/<.*//g"

done
