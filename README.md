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
$ curl -sSL https://raw.githubusercontent.com/amutake/dotfiles/master/setup/Brewfile | brew bundle --file=-
$ chezmoi init --apply amutake
```

For more details, see [chezmoi quick start page](https://www.chezmoi.io/quick-start/).
