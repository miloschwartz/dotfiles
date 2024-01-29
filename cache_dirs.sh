#!/bin/bash

# Define the cache file location
CACHE_FILE="$HOME/.dir_cache"

# Define the starting directory
START_DIR="$HOME"

# Define a temporary file for storing the output
TEMP_FILE=$(mktemp)

# Cache directories, excluding .hidden and node_modules directories
if find "$START_DIR" -path '*/\.*' -prune -o -path '*/node_modules/*' -prune -o -type d -print > "$TEMP_FILE"; then
    # If find command is successful, move the temporary file to the cache file
    mv "$TEMP_FILE" "$CACHE_FILE"
else
    # If find command fails, remove the temporary file and exit with an error
    rm "$TEMP_FILE"
    echo "Failed to update directory cache."
    exit 1
fi
