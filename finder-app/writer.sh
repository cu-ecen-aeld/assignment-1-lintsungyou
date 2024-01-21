#!/bin/sh

#Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir;
#the second argument is a text string which will be searched within these files, referred to below as searchstr

#Exits with return value 1 error and print statements if any of the parameters above were not specified

#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

#Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files.


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


writeFile=$1
writeStr=$2

dir_path=$(dirname "$writeFile")
file_name=$(basename "$writeFile")

if [ ! -d "$dir_path" ]; then
	mkdir -p "$dir_path"
fi
touch "$writeFile"
echo "$2" > "$writeFile"