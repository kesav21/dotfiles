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
	[ -d .git ] && echo "($(git branch --show-current))"
}

PROMPT='%{${ret_status}%}%{$fg[blue]%}[%~] $ %{$reset_color%}'
RPROMPT='%{$fg[magenta]%}$(__git_ps1)%{$reset_color%}'
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

# vi-mode {{{

KEYTIMEOUT=20

bindkey -v
bindkey -s jk "\e"

# change cursor shape for different vi modes
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]
	then
		echo -ne "\e[1 q"

	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
		[[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]
	then
		echo -ne "\e[5 q"
	fi
}
zle -N zle-keymap-select

function zle-line-init {
	echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne "\e[5 q"
# Use beam shape cursor for each new prompt.
preexec() { echo -ne "\e[5 q" ;}

# }}}

# load {{{

# set up aliases
source "$XDG_CONFIG_HOME"/shell/aliases
# set up fzf
source "$XDG_CONFIG_HOME"/fzf/fzfrc
# source /usr/share/fzf/key-bindings.zsh
# set up node version manager
export NVM_SOURCE="$XDG_CONFIG_HOME"/nvm
[ -s "$NVM_SOURCE"/nvm.sh ] && source "$NVM_SOURCE"/nvm.sh
# set up ssh
eval "$(ssh-agent)" > /dev/null

# }}}

# zplug {{{

FORGIT_NO_ALIASES=1

export ZPLUG_HOME="$XDG_SRC_DIR"/zplug
source "$XDG_SRC_DIR"/zplug/init.zsh

zplug "zplug/zplug"
zplug "hlissner/zsh-autopair"
zplug "zdharma/fast-syntax-highlighting"
zplug 'wfxr/forgit'

zplug check || zplug install

zplug load

# }}}
