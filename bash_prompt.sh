#!/usr/bin/env bash
# Inspired by https://github.com/necolas/dotfiles

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    eval $(dircolors ~/dotfiles/dircolors.ansi-dark)
elif [[ "$unamestr" == 'Darwin' ]]; then
    # Assuming brew install coreutils
    eval $(gdircolors ~/dotfiles/dircolors.ansi-dark)
fi

prompt_git() {
    local s=""
    local branchName=""

    # check if the current directory is in a git repository
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?) == 0 ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

            # ensure index is up to date
            git update-index --really-refresh  -q &>/dev/null

            # check for uncommitted changes in the index
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s="$s+";
            fi

            # check for unstaged changes
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s="$s!";
            fi

            # check for untracked files
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s="$s?";
            fi

            # check for stashed files
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s="$s$";
            fi

        fi

        # get the short symbolic ref
        # if HEAD isn't a symbolic ref, get the short SHA
        # otherwise, just give up
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      printf "(unknown)")"

        [ -n "$s" ] && s=" [$s]"

        printf "%s" "$1$branchName$s"
    else
        return
    fi
}

set_prompts() {
    local black=""
    local blue=""
    local bold=""
    local cyan=""
    local green=""
    local orange=""
    local purple=""
    local red=""
    local reset=""
    local white=""
    local yellow=""

    local hostStyle=""
    local userStyle=""

    tput sgr0 # reset colors

    bold=$(tput bold)
    reset=$(tput sgr0)

    # Solarized colors
    # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
    black=$(tput setaf 0)
    blue=$(tput setaf 33)
    cyan=$(tput setaf 37)
    green=$(tput setaf 64)
    orange=$(tput setaf 166)
    purple=$(tput setaf 125)
    red=$(tput setaf 124)
    white=$(tput setaf 15)
    yellow=$(tput setaf 136)

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="$bold$red"
    else
        userStyle="$orange"
    fi

    # connected via ssh
    if [[ "$SSH_TTY" ]]; then
        hostStyle="$bold$red"
    else
        hostStyle="$yellow"
    fi

    # set the terminal title to the current working directory
    PS1="\[\e]0;\w\a\]"

    PS1+="\[$userStyle\]\u" # username
    PS1+="\[$reset\]@"
    PS1+="\[$hostStyle\]\h" # host
    PS1+="\[$reset\]: "
    PS1+="\[$green\]\w" # working directory
    PS1+="\$(prompt_git \"$purple on $cyan\")" # git repository details
    PS1+="\n"
    PS1+="\[$reset\]\$ \[$reset\]" # $ (and reset color)

    export PS1
}

set_prompts
unset set_prompts

