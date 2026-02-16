#!/bin/bash

# Replace copyright year strings across all files
# Handles common patterns like "Copyright 2025" or "Copyright (c) 2025"
# Detects any 4-digit year and updates it to the current year

CURRENT_YEAR=$(date +%Y)

FILES_CHANGED=0

for file in $(grep -rl "Copyright.*[0-9]\{4\}" --include="*.php" --include="*.md" --include="*.txt" --include="*.js" . 2>/dev/null); do
    if grep -q "Copyright.*$CURRENT_YEAR" "$file"; then
        continue
    fi
    sed -i "s/Copyright\(.*\)[0-9]\{4\}/Copyright\1$CURRENT_YEAR/g" "$file"
    FILES_CHANGED=$((FILES_CHANGED + 1))
    echo "Updated: $file"
done
