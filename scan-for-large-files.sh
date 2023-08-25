#!/bin/bash

## Get all the items in the /home directory and collect them in a list
folders=$(ls /home)

## Remove the folder "virtfs" from the list if it exists
folders=$(echo $folders | sed 's/virtfs//g')

## Remove any of the items if they are not a directory
for folder in $folders; do
    if [ ! -d "/home/$folder" ]; then
        folders=$(echo $folders | sed "s/$folder//g")
    fi
done

## Make a list called "large_files" to store the largest 20 files
large_files=""

## Scan through the list of folders and collect a list of the largetst 20 file
for folder in $folders; do
    large_files="$large_files $(find /home/$folder -type f -exec du -aSh {} + | sort -rh | head -n 20)"
done

## Sort the list by size and print the top 20 largest files on their own line
echo "$large_files" | sort -rh | head -n 20
