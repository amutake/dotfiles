amutake's dotfiles
==================

dotfiles are managed by [chezmoi](https://chezmoi.io/).

Supported OS
------------

- Apple Silicon macOS
- Intel macOS
- x86_64 GNU/Linux

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
$ echo "$(which zsh)" | sudo tee -a /etc/shells
$ chsh -s $(which zsh)
```

For more details, see [chezmoi quick start page](https://chezmoi.io/quick-start/).

Troubleshoot
------------

### How to edit files?

See https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/

If you edited the file in your home directory, use `chezmoi re-add $FILE` (if the file is not templated) or `chezmoi merge $FILE`.

### Tmux is not started by `client loop enter` after `brew upgrade`

Terminate tmux by `pkill -9 tmux`. https://stackoverflow.com/a/61650205
