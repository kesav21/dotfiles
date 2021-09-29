#!/bin/zsh

# vim: set foldmethod=marker:

setopt interactivecomments

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME"/zsh/history

# completion {{{

autoload -U compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# }}}

# prompt {{{

autoload -U colors && colors
setopt PROMPT_SUBST

__git_ps1() {
	branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
	[ -n "$branch" ] && printf '[%s]' "$branch"
}

# PROMPT='%{${ret_status}%}%{$fg[blue]%}[%~] $ %{$reset_color%}'
# RPROMPT='%{$fg[magenta]%}$(__git_ps1)%{$reset_color%}'
# PROMPT_EOL_MARK=''

PROMPT='%{$fg[blue]%}[%~] %{$fg[blue]%}$(__git_ps1)
$ %{$reset_color%}'
RPROMPT=''
PROMPT_EOL_MARK=''

# }}}

# keymap {{{

# edit line in vim
autoload edit-command-line
zle -N edit-command-line
bindkey '^o' edit-command-line
bindkey -M vicmd '^o' edit-command-line

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# }}}

# less colors {{{

export LESS=-R
export LESS_TERMCAP_mb="$(printf '\e[1;31m')"
export LESS_TERMCAP_md="$(printf '\e[1;36m')"
export LESS_TERMCAP_me="$(printf '\e[0m')"
export LESS_TERMCAP_so="$(printf '\e[01;44;33m')"
export LESS_TERMCAP_se="$(printf '\e[0m')"
export LESS_TERMCAP_us="$(printf '\e[1;32m')"
export LESS_TERMCAP_ue="$(printf '\e[0m')"

# }}}

# load {{{

# set up vi-mode
source "$XDG_CONFIG_HOME"/zsh/vi-mode
# set up aliases
source "$XDG_CONFIG_HOME"/zsh/aliases
# set up file openers
source "$XDG_CONFIG_HOME"/zsh/openfiles
# set up fzf bindings
source "$XDG_CONFIG_HOME"/zsh/fzf

# }}}

# zplug {{{

FORGIT_NO_ALIASES=1
# VIM_MODE_TRACK_KEYMAP=no

source "$ZPLUG_HOME"/init.zsh

zplug 'zplug/zplug'
zplug 'hlissner/zsh-autopair'
zplug 'zdharma/fast-syntax-highlighting'
zplug 'wfxr/forgit'
zplug 'Aloxaf/fzf-tab'
# zplug 'softmoth/zsh-vim-mode'

zplug check || zplug install

zplug load

# }}}
