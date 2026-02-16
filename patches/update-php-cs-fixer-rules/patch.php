<?php

// Add or update a PHP-CS-Fixer rule in .php-cs-fixer.php
// Customize the rule name and value below

$ruleToAdd = "'no_unused_imports' => true";
$configFile = '.php-cs-fixer.php';

if (!file_exists($configFile)) {
    echo 'No ' . $configFile . ' found, skipping' . PHP_EOL;
    exit(0);
}

$content = file_get_contents($configFile);

if (strpos($content, 'no_unused_imports') !== false) {
    echo 'Rule no_unused_imports already present, skipping' . PHP_EOL;
    exit(0);
}

// Insert the new rule before the closing bracket of the rules array
$content = preg_replace(
    '/(->setRules\(\[.*?)(]\))/s',
    '$1    ' . $ruleToAdd . ',' . PHP_EOL . '    $2',
    $content
);

file_put_contents($configFile, $content);
echo 'Added rule no_unused_imports to ' . $configFile . PHP_EOL;
