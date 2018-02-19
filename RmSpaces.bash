#!/bin/bash
# Author: Tursko (Taylor Riley)

# This is a very simple script that removes any set of spaces that
# are not 1 space. 
# Example input: tursko     programming
# Example output: tursko programming

# Added a catch for file extensions (2-18-2018)
	# NOTE: if file name is something like FileName.s.txt , the resulting file name
	# will be extremely off. 
	# Only works for file names like: { file or file.txt or file.c or file.hey }

echo "" > ExtNoName
echo "" > ExtExists
if [ $# -ne 1 ]; then
    	echo "Usage: "$0" [filename]"
    	exit 1;
fi

if [ -e "$1" ]; then
	echo "$1" > fullName #this is just the filename
	#grabbing file name and its ext
	sed 's/\..*//g' fullName > FileNameNoExt
	read FileName < FileNameNoExt
	if grep -e "\." < fullName > ExtExists; then
		sed 's/.*\.//g' fullName > ExtNoName
		read FileExt < ExtNoName
		
		sed -E 's/  */ /g' "$1" > "$FileName-NEW.$FileExt"
		echo "----------"
		echo "Successfully removed all unnecessary spaces from $1"
		echo "New file is called '$FileName-NEW.$FileExt'"
	else
		sed -E 's/  */ /g' "$1" > "$1-NEW"
		echo "----------"
		echo "Successfully removed all unnecessary spaces from $1"
		echo "New file is called '$1-NEW'"
	fi
else
    	echo "The file '"$1"' does not exist"
fi

rm ExtNoName
rm ExtExists
rm fullName
rm FileNameNoExt
