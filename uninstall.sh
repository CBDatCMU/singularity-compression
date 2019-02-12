#!/bin/bash

IMAGE=singularity-compression
DIRECTORY=~/.singularity

FILES=($DIRECTORY/$IMAGE.simg ~/bin/unrar ~/bin/rar ~/bin/7z)

for FILE in "${FILES[@]}"
do
	echo "Removing "$FILE
	if [ -f $FILE ]; then
		rm -fv $FILE
	fi
done
