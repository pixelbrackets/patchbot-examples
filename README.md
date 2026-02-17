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

### Import

```bash
# Create a skeleton project if you don't have one yet
composer create-project pixelbrackets/patchbot-skeleton my-patches

# Import all patches
./vendor/bin/patchbot import https://github.com/pixelbrackets/patchbot-examples

# Import a single patch only by path
./vendor/bin/patchbot import https://github.com/pixelbrackets/patchbot-examples --path=patches/add-editorconfig
```

### Customize

Each patch has configurable values at the top of the script (package names,
file paths, search strings). Edit them before running the patch.

All patches are idempotent - they skip gracefully when the change was
already applied.

See the [Patchbot walkthrough](https://github.com/pixelbrackets/patchbot/blob/master/docs/walkthrough.md)
for a guide on creating and testing patches.

### Apply

```bash
# Apply a patch to a single repository
./vendor/bin/patchbot patch add-editorconfig git@gitlab.com:user/repo.git
```

Read the full guides on [applying patches](https://github.com/pixelbrackets/patchbot/#usage) to a selected repository
or across many repositories in batch mode.

## License

GNU General Public License version 2 or later

## Author

Dan Kleine ([@pixelbrackets](https://pixelbrackets.de))
