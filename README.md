# Patchbot Examples

Example patches for [Patchbot](https://github.com/pixelbrackets/patchbot) -
ready to use, customize, or learn from.

Each patch directory contains a patch script and a commit message template.
Copy a patch into your own Patchbot project and adjust it to your needs.

## Patches

| Patch | Type | Description |
|-------|------|-------------|
| [find-and-replace](patches/find-and-replace/) | Shell | Generic find-and-replace across files (URLs, class names, config values) |
| [add-editorconfig](patches/add-editorconfig/) | PHP | Add an `.editorconfig` file for consistent coding styles |
| [add-gitattributes](patches/add-gitattributes/) | PHP | Add `.gitattributes` with export-ignore rules for smaller Composer packages |
| [add-php-package](patches/add-php-package/) | Shell | Add a Composer package to `composer.json` |
| [update-php-cs-fixer-rules](patches/update-php-cs-fixer-rules/) | PHP | Add or update a rule in `.php-cs-fixer.php` |
| [replace-copyright-year](patches/replace-copyright-year/) | Shell | Replace copyright year strings across all files |
| [rename-vendor-name](patches/rename-vendor-name/) | Shell | Rename a vendor/company name and PHP namespace |
| [rename-file](patches/rename-file/) | Shell | Rename a file |
| [remove-deprecated-files](patches/remove-deprecated-files/) | Shell | Remove deprecated CI config files |

## Usage

### Import a single patch

Copy a patch directory into your Patchbot project:

```bash
cp -r /path/to/patchbot-examples/patches/add-editorconfig my-patches/patches/
```

Or clone this repo and copy what you need:

```bash
git clone https://github.com/pixelbrackets/patchbot-examples.git
cp -r patchbot-examples/patches/add-editorconfig my-patches/patches/
```

### Use the whole repo as a patch project

This repository follows the Patchbot project structure. You can use it
directly with Patchbot:

```bash
cd patchbot-examples
composer require pixelbrackets/patchbot
./vendor/bin/patchbot patch add-editorconfig git@gitlab.com:user/repo.git
```

### Customize

Each patch has configurable values at the top of the script (package names,
file paths, search strings). Edit them before running the patch.

All patches are idempotent - they skip gracefully when the change was
already applied.

## Writing your own patches

See the [Patchbot walkthrough](https://github.com/pixelbrackets/patchbot/blob/master/docs/walkthrough.md)
for a guide on creating and testing patches.

## License

GNU General Public License version 2 or later

## Author

Dan Kleine ([@pixelbrackets](https://pixelbrackets.de))
