#!/bin/sh

source ~/dotfiles/aliases_all.sh

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    source ~/dotfiles/aliases_linux.sh
    alias ls='ls --color'
fi

source ~/dotfiles/bash_prompt.sh
source ~/dotfiles/git-completion.bash
