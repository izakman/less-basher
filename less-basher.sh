#!/bin/bash

LESS_DIR=$1
CSS_DIR=$2

# Check args
if [[ $# -ne 2 || ! -d $LESS_DIR || -f $CSS_DIR ]]; then
	echo Usage: `basename $0` input_directory output_directory
	exit 1
fi

# Create output directory if it doesn't exist
if [[ ! -d $CSS_DIR ]]; then
	mkdir $CSS_DIR
	echo Created $CSS_DIR
fi

cd $LESS_DIR

# Grab all .less files in the input directory that aren't within an
# includes directory
LESS_FILES=`find . -name '*.less' ! -wholename '*/includes/*'`

# Compile LESS files to CSS files and move them to the output directory
for file in $LESS_FILES; do
	CSS_FILE="${file%.less}.css"
	lessc $file > $CSS_FILE
	# Copy the CSS, keeping the directory structure and overwriting
	# existing files
	cp --parents --remove-destination $CSS_FILE $CSS_DIR
	rm $CSS_FILE
done
