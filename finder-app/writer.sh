#!/bin/sh

if [ $# -ne 2 ]
then
    echo "Either file name or text string is not specified"
    exit 1
fi

writefile=$1
writestr=$2

dir=$(dirname $writefile)
filename=$(basename $writefile)

# Create dir
mkdir -p $dir
retval=$?
if [ $retval -ne 0 ]
then
    echo "Failed to create directory $dir with exit code $?"
    exit 1
fi

echo "$writestr" > $writefile
retval=$?
if [ $retval -ne 0 ]
then
    echo "Failed to create write file $filename in dir $dir with exit code $?"
    exit 1
fi