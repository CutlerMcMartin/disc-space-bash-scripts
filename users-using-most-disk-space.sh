#!/bin/bash

## Find the top largest folders in the /home directory and print them, exclude the virtfs folder
du -sh /home/* | sort -rh | head -n 10 | grep -v virtfs
