autoload -Uz colors vcs_info
colors

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'

# This variable is used to skip printing the newline above PROMPT if this is a
# fresh terminal session or the terminal was just cleared
skip_newline=true

preexec() {
    if [[ "$1" == "clear" ]]; then
        skip_newline=true
    fi
}

precmd() {
    if [[ "$skip_newline" == true ]]; then
        skip_newline=false
    else
        echo
    fi

    vcs_info
    print -P "%F{cyan}%~%f %F{magenta}${vcs_info_msg_0_}%f"
    PROMPT='%# '
}

HISTFILE=~/.zsh_history   # file to save history
HISTSIZE=1000             # number of commands to keep in memory
SAVEHIST=1000             # number of commands to save to HISTFILE
setopt append_history     # append to history file, don’t overwrite
setopt hist_ignore_dups   # skip consecutive duplicate commands
setopt hist_ignore_space  # skip commands starting with a space
setopt share_history      # sync history across all running zsh sessions
setopt inc_append_history # write each command immediately

setopt auto_cd           # cd into a directory without typing cd
setopt correct           # auto-correct typos in commands

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

cd() {
    if [ "$1" = "config" ]; then
        builtin cd ~/Documents/GitHub/config/
    else
        builtin cd "$@"
    fi
}

alias ls='ls --color=auto'
alias ll='ls -lahF'

export PATH="/opt/nvim/:$PATH"
