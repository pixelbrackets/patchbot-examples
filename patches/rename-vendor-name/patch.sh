#!/bin/bash

# Replace a vendor or company name across all files
# Handles both plain text (URLs, docs) and PHP namespaces
# Customize the values below

# Plain name (URLs, docs, config files)
OLD_NAME="old-company"
NEW_NAME="new-company"

# PHP namespace vendor (PSR-4 autoloading, use statements)
OLD_NAMESPACE="OldCompany"
NEW_NAMESPACE="NewCompany"

FILES_CHANGED=0

# Replace plain name in all common file types
for file in $(grep -rl "$OLD_NAME" --include="*.php" --include="*.md" --include="*.json" --include="*.yml" --include="*.yaml" --include="*.xml" --include="*.txt" . 2>/dev/null); do
    sed -i "s/$OLD_NAME/$NEW_NAME/g" "$file"
    FILES_CHANGED=$((FILES_CHANGED + 1))
    echo "Updated (name): $file"
done

# Replace PHP namespace vendor in PHP and config files
for file in $(grep -rl "$OLD_NAMESPACE" --include="*.php" --include="*.json" . 2>/dev/null); do
    sed -i "s/$OLD_NAMESPACE/$NEW_NAMESPACE/g" "$file"
    FILES_CHANGED=$((FILES_CHANGED + 1))
    echo "Updated (namespace): $file"
done

if [ "$FILES_CHANGED" -eq 0 ]; then
    echo "No files containing '$OLD_NAME' or '$OLD_NAMESPACE' found"
else
    echo "Updated $FILES_CHANGED file(s)"
fi
