#!/bin/bash

# Add a PHP package to the project
# Customize the package name below before running

PACKAGE="vendor/package-name"

if [ ! -f "composer.json" ]; then
    echo "No composer.json found, skipping"
    exit 0
fi

composer require --no-interaction --no-update "$PACKAGE"
echo "Added $PACKAGE to composer.json"
