# dotfiles

This repository is used to store all my configuration files so I can quickly get my environment up and running when I set-up new machines (e.g. .vimrc, .tmux.conf, etc.).

Currently it contains configurations for:

* bash prompt (with git integration), colours, aliases
* vim
* tmux
* convenience scripts such as Google Drive download script

## Setup

This configuration is designed for the bash shell on both Linux and Mac OS X. For Mac OS X, one is required to have GNU coreutils installed before using it (`brew install coreutils`). This is required for tools like `gdircolor` which simply exists in Linux as `dircolor`.

* Clone the repository into the home directory.
* Add the following to the `.bash_profile`:
```
source ~/dotfiles/source_all.sh
```
* Create symlinks to `~/dotfiles/.vimrc` and `~/dotfiles/.bashrc` from the home directory. If you already have these files in your home directory consider making backups, i.e. `mv ~/.vimrc ~/.vimrc.back`.
```
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```
* Install vim plugins: `~/dotfiles/setup-vim.sh`

## Issues

Have issues, seen a bug, or want to request an improvement? Please file an issue!

## TODO

* Add zsh configs.
