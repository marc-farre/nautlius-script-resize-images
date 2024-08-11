#!/bin/bash

# Default values
DEFAULT_WIDTH=1600
DEFAULT_QUALITY=60

# Prompt for width
width=$(zenity --entry --title="Resize Images" --text="Enter desired width in pixels:" --entry-text="$DEFAULT_WIDTH")
if [ $? -ne 0 ]; then
    exit 1
fi

# If no input, use default
if [ -z "$width" ]; then
    width=$DEFAULT_WIDTH
fi

# Prompt for quality
quality=$(zenity --scale --title="Compress Images" --text="Select JPEG compression quality:" --min-value=0 --max-value=100 --value="$DEFAULT_QUALITY" --step=1)
if [ $? -ne 0 ]; then
    exit 1
fi

# If no input, use default
if [ -z "$quality" ]; then
    quality=$DEFAULT_QUALITY
fi

# Process each selected file
for file in "$@"; do
    if [[ $file == *.jpg || $file == *.jpeg || $file == *.png || $file == *.gif ]]; then
        directory=$(dirname "$file")
        filename=$(basename "$file")
        extension="${filename##*.}"
        filename="${filename%.*}"
        
        output_file="${directory}/${filename}_resized.jpg"
        
        convert "$file" -resize "${width}x>" -quality "$quality%" "$output_file"
        
        if ![ $? -eq 0 ]; then
            zenity --error --text="Error processing: $file"
        fi
    fi
done

zenity --info --text="All images processed"