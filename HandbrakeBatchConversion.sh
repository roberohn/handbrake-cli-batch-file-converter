#!/bin/bash

OUTPUT_DIR="converted"
PRESET="Apple 1080p30 Surround"

# Promp for directory path
read -p "Enter the path to the files to convert: " INPUT_DIR

# Check directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Directory not found: $INPUT_DIR"
    exit 1
fi

# Make a new folder within the input directory for the newly converted files
mkdir -p "$INPUT_DIR/$OUTPUT_DIR"

    for file in "$INPUT_DIR"/*.mkv; do
        filename=$(basename "$file" .mkv)

    if [[ -f "$INPUT_DIR/$filename.mp4" ]]; then
        echo "Skipping $filename (already exists)"
        continue
    fi
            HandBrakeCLI \
                -i "$file" \
                -o "$INPUT_DIR/$OUTPUT_DIR/$filename.mp4" \
                --preset "$PRESET"
        done
