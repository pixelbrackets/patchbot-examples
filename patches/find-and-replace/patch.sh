#!/bin/bash

# Generic find-and-replace across files
# Customize SEARCH, REPLACE, and FILE_PATTERN below
#
# Examples:
#   Replace a deprecated URL:     SEARCH="http://old-domain.com" REPLACE="https://new-domain.com"
#   Rename a PHP class:           SEARCH="OldClassName" REPLACE="NewClassName"
#   Update a config value:        SEARCH="debug: true" REPLACE="debug: false"

SEARCH="old-value"
REPLACE="new-value"
FILE_PATTERN="*"  # e.g. "*.php", "*.md", "*.yml"

FILES_CHANGED=0

for file in $(grep -rl "$SEARCH" --include="$FILE_PATTERN" . 2>/dev/null); do
    sed -i "s|$SEARCH|$REPLACE|g" "$file"
    FILES_CHANGED=$((FILES_CHANGED + 1))
    echo "Updated: $file"
done

if [ "$FILES_CHANGED" -eq 0 ]; then
    echo "No files containing '$SEARCH' found"
else
    echo "Replaced '$SEARCH' with '$REPLACE' in $FILES_CHANGED file(s)"
fi
