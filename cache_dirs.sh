#!/bin/bash

# Define the cache file location
CACHE_FILE="$HOME/.dir_cache"

# Define the starting directory
START_DIR="$HOME"

# Cache directories, excluding .hidden and node_modules directories
find "$START_DIR" -path '*/\.*' -prune -o -path '*/node_modules/*' -prune -o -type d -print > "$CACHE_FILE"
