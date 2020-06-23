#!/bin/zsh

# vim: set foldmethod=marker:

echo sourced zshrc

setopt interactivecomments

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

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
source $(which git_prompt)
setopt PROMPT_SUBST

PROMPT='%{${ret_status}%}%{$fg[blue]%}[%~] ❯ %{$reset_color%}'
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

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

forgit_add=gia
forgit_diff=gid
forgit_log=gil
forgit_reset_head=girh
forgit_ignore=gii
forgit_restore=gicf
forgit_clean=giclean
forgit_stash_show=giss

FORGIT_FZF_DEFAULT_OPTS="--height 100% --border "

source $XDG_SRC_DIR/zplug/init.zsh

zplug "zplug/zplug"
zplug "hlissner/zsh-autopair"
zplug "zdharma/fast-syntax-highlighting"
zplug 'wfxr/forgit'

echo 'loading zplug'

zplug load

# }}}

