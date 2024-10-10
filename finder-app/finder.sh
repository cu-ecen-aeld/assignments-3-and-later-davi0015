#!/bin/sh

if [ $# -ne 2 ]
then
    echo "Either directory or search string is not specified"
    exit 1
fi

filedir=$1
searchstr=$2

if [ ! -d $filedir ]
then
    echo "Directory does not exist"
    exit 1
fi

files=$(find $filedir -type f)
file_count=$(echo "$files" | wc -l)

matching_line_count=$(cat $(echo "$files") | grep $searchstr | wc -l)

echo "The number of files are $file_count and the number of matching lines are $matching_line_count"