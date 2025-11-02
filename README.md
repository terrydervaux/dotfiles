# Dotfiles

This repository contains my personal dotfiles configuration.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)

  ```bash
  sudo apt-get install stow
  ```

- [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm)

  ```bash
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- [NodeJS](https://nodejs.org/en/download/) required by `nvim-copilot` plugin
- `clang` and `make` required by `telescope-fzf-native.nvim` plugin

  ```bash
  sudo apt-get install \
    clang \
    make
  ```

- `unzip` required by `mason.nvim` plugin

  ```bash
  sudo apt-get install unzip
  ```

- linters required by `none-ls.nvim` plugin

  ```bash
  npm install -g \
    markdownlint-cli \
    prettier
  ```

## Installation

```bash
stow .

echo "# tmux alias to use XDG base directory spec" >> ~/.bashrc
echo "alias tmux='tmux -f ~/.config/tmux/.tmux.conf'" >> ~/.bashrc
```
