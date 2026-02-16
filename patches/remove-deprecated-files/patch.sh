#!/bin/bash

# Remove deprecated files that are no longer needed
# Add or remove filenames in the list below

DEPRECATED_FILES=(
    ".travis.yml"
    ".scrutinizer.yml"
    "Gruntfile.js"
)

FILES_REMOVED=0

for file in "${DEPRECATED_FILES[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        FILES_REMOVED=$((FILES_REMOVED + 1))
        echo "Removed: $file"
    fi
done

if [ "$FILES_REMOVED" -eq 0 ]; then
    echo "No deprecated files found"
else
    echo "Removed $FILES_REMOVED file(s)"
fi
