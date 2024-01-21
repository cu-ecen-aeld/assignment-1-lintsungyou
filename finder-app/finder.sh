#!/usr/bin/env bash

#Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir;
#the second argument is a text string which will be searched within these files, referred to below as searchstr

#Exits with return value 1 error and print statements if any of the parameters above were not specified

#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

#Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files.
export PATH=/usr/bin/bash:$PATH

fileStr=$1
searchStr=$2


if [ $# -lt 2 ]; then
	echo "not enough arguments"
	echo "$#"
	return 1
fi


if [ $# -gt 2 ]; then
	echo "too much arguments"
	echo "$#"
	return 1
fi

if ! [ -d "$1" ]; then
	echo "dir not exists"
	echo "$1"
	return 1
fi

scriptStr="./searchStrInFile.py"
argStr="$searchStr"
shopt -s globstar
for entry in "$fileStr"/*
do
	if test -d "$entry"; then
		continue
	fi
	argStr+=("${entry}")
done

fileNums=$(find -L "$fileStr" -type f -printf "%f\n" 2> /dev/null | grep -c .)


findResult=$(python3 "$scriptStr" "${argStr[@]}")

echo "The number of files are $fileNums and the number of matching lines are $findResult"
