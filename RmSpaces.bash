#!/bin/bash
#Author: Tursko

#This is a very simple script that removes any set of spaces that
#are not 1 space. 
#Example input: tursko     programming
#Example output: tursko programming

#Future additions: I want to be able to keep the same extention.
#So if the input file is 'tursko.txt', currently it would make the
#new output file 'tursko.txt_new'. I want it to be 'tursko_new.txt'

if [ $# -ne 1 ]; then
    echo "Usage: "$0" [filename]"
    exit 1;
fi
if [ -e "$1" ]; then
    #xt=sed 's/^\w\+.//' <<< "$1" #attempt at fixing extention issue
    sed -E 's/  */ /g' "$1" > "$1_new"
    echo "Successfully fixed all the spacing in the file '"$1"'"
    echo "New file is called '$1_new'"
    #echo "New file is called '"$1_New.$ext"'"
else
    echo "The file '"$1"' does not exist"
fi
