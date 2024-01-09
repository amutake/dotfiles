amutake's dotfiles
==================

dotfiles are managed by [chezmoi](https://www.chezmoi.io/).

Supported OS
------------

- Apple Silicon macOS
- Intel macOS

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

For more details, see [chezmoi quick start page](https://www.chezmoi.io/quick-start/).

Troubleshoot
------------

### Tmux is not started by `client loop enter` after `brew upgrade`

Terminate tmux by `pkill -9 tmux`. https://stackoverflow.com/a/61650205
