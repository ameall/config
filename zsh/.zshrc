### PROMPT ###
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

### HISTORY ###
HISTFILE=~/.zsh_history   # file to save history
HISTSIZE=1000             # number of commands to keep in memory
SAVEHIST=1000             # number of commands to save to HISTFILE
setopt append_history     # append to history file, don’t overwrite
setopt hist_ignore_dups   # skip consecutive duplicate commands
setopt hist_ignore_space  # skip commands starting with a space
setopt share_history      # sync history across all running zsh sessions
setopt inc_append_history # write each command immediately

### CUSTOM FUNCTIONS ###
set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

# Define named directories
declare -A CD_DIRS=(
    ["config"]="$HOME/Documents/GitHub/config"
)

cd() {
    if [[ -n "$1" && ${CD_DIRS[$1]+_} ]]; then
        builtin cd "${CD_DIRS[$1]}" || return
    else
        builtin cd "$@" || return
    fi
}

### ALIASES ###
alias ls='ls --color=auto'
alias ll='ls -lahF'

### EXPORTS ###
export PATH="/opt/nvim/:$PATH"
