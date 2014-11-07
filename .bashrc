#PS1='[\u@\h \W]\$ '  # Default
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
PS1='\[\e[00;32m\]\u@\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;35m\]\w\[\e[0m\]\[\e[00;37m\]\\$ \[\e[0m\]'

alias ls='ls --color=auto'
alias tmux="TERM=screen-256color-bce tmux"

eval $( dircolors -b $HOME/LS_COLORS )
