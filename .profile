#!/bin/sh

echo "sourced .profile"

# set system env variables

export EDITOR=/usr/bin/nvim
export ZDOTDIR="$HOME/.config/zsh"
export FZF_DEFAULT_COMMAND='find . -type f | grep -v '\.git/' | grep -v '__pycache__/' | grep -v '\.pytest_cache' | grep -v '\.env''

# set my env variables

export ICONPATH="$HOME/.icons/fa-5.10.2-desktop"
export SCRIPTSPATH="$HOME/.local/scripts"
export BINPATH="$HOME/.local/bin"

# add local scripts to PATH

bin_in_path=$(echo "$PATH" | grep "$BINPATH")
# if bin is not in path, add bin to path
[ -z "$bin_in_path" ] && PATH="$PATH:$BINPATH"

# set colored output

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=always'

# colored man pages

export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '')"
export LESS_TERMCAP_md="$(printf '%b' '')"
export LESS_TERMCAP_me="$(printf '%b' '')"
export LESS_TERMCAP_so="$(printf '%b' '')"
export LESS_TERMCAP_se="$(printf '%b' '')"
export LESS_TERMCAP_us="$(printf '%b' '')"
export LESS_TERMCAP_ue="$(printf '%b' '')"

# start x

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then
	exec startx
fi

