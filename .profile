#!/bin/sh

echo "sourced .profile"

# set environment variables

export EDITOR=/usr/bin/nvim
export ICONPATH="$HOME/.icons/fa-5.10.2-desktop"
export SCRIPTSPATH="$HOME/.local/scripts"
export BINPATH="$HOME/.local/bin"

export ZDOTDIR="$HOME/.config/zsh"

# add local scripts to PATH

bindir="/home/kesav/.local/bin"
bin_in_path=$(echo "$PATH" | grep "$bindir")

# if bin is not in path
if [ -z "$bin_in_path" ]
then
	# add bin to path
	PATH="$PATH:$bindir"
fi

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

export FZF_DEFAULT_COMMAND='find . -type f | grep -v '\.git/' | grep -v '__pycache__/' | grep -v '\.pytest_cache' | grep -v '\.env''

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then
	exec startx
fi

