<?php

// Add a .gitattributes file with export-ignore rules
// Edit the .gitattributes file next to this script to customize the rules

if (file_exists('.gitattributes')) {
    echo '.gitattributes already exists, skipping' . PHP_EOL;
    exit(0);
}

$patchDir = dirname(__FILE__);
copy($patchDir . '/.gitattributes', '.gitattributes');
echo 'Created .gitattributes' . PHP_EOL;
