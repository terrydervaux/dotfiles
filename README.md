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

- `wl-clipboard` required by `tmux-yank` plugin (Wayland clipboard support)

  ```bash
  sudo apt-get install wl-clipboard
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

- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)
  required by `nvim-treesitter` plugin

  Requires
  [Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html),
  then:

  ```bash
  cargo install --locked tree-sitter-cli
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
