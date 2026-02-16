#!/bin/bash

# Rename a file to follow a new naming convention
# Customize OLD_NAME and NEW_NAME below

OLD_NAME="LICENSE"
NEW_NAME="LICENSE.txt"

if [ ! -f "$OLD_NAME" ]; then
    echo "File $OLD_NAME not found, skipping"
    exit 0
fi

if [ -f "$NEW_NAME" ]; then
    echo "File $NEW_NAME already exists, skipping"
    exit 0
fi

mv "$OLD_NAME" "$NEW_NAME"
echo "Renamed $OLD_NAME to $NEW_NAME"
