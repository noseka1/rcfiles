export PS1="$TITLEBAR"'\[\033[42;1;37m\][\u@\h $PWD]\$\[\033[0m\]'

# ls command
export LS_OPTIONS='-F -T 0 --color=auto'
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

export P4CONFIG=.p4config