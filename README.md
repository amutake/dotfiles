amutake's dotfiles
==================

dotfiles are managed by [chezmoi](https://www.chezmoi.io/).

Prerequisites
-------------

- [curl](https://curl.se/)
- [Homebrew](https://brew.sh/)

Installation
------------

```sh
$ curl -fsSL https://raw.githubusercontent.com/amutake/dotfiles/master/setup/Brewfile | brew bundle --file=-
$ gpg --full-generate-key # Generate a GPG key. ref: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
...
$ chezmoi init --apply amutake
```

For more details, see [chezmoi quick start page](https://www.chezmoi.io/quick-start/).
