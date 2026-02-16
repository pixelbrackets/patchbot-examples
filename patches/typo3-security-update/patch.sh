#!/bin/bash

# Update TYPO3 core packages to the latest security release
#
# Usage with Patchbot (filter by topic or name):
#   ./vendor/bin/patchbot patch-many typo3-security-update --filter="topic:typo3"
#   ./vendor/bin/patchbot patch-many typo3-security-update --filter="path:*typo3*"
#   ./vendor/bin/patchbot patch-many typo3-security-update --filter="topic:typo3" --create-mr --dry-run

if [ ! -f "composer.json" ]; then
    echo "No composer.json found, skipping"
    exit 0
fi

if ! grep -q "typo3/cms-core" composer.json; then
    echo "Not a TYPO3 project (typo3/cms-core not found), skipping"
    exit 0
fi

echo "Updating TYPO3 core packages"
composer update --no-interaction --with-dependencies "typo3/cms-*"
echo "TYPO3 core packages updated"
