<?php

// Add an .editorconfig file to enforce consistent coding style
// Edit the .editorconfig file next to this script to customize the rules

if (file_exists('.editorconfig')) {
    echo 'EditorConfig already exists - Abort';
    exit(0);
}

copy(__DIR__ . '/.editorconfig', '.editorconfig');
echo 'Created .editorconfig' . PHP_EOL;
