# Dotfiles

This repository contains my personal dotfiles configuration.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm)

  ```bash
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```
- `ripgrep` for nvim telescope plugin

  ```bash
  sudo apt install ripgrep
  ```

## Installation

```bash
stow .

echo "# tmux alias to use XDG base directory spec" >> ~/.bashrc
echo "alias tmux='tmux -f ~/.config/tmux/.tmux.conf'" >> ~/.bashrc
```
