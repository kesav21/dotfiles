# vim: set foldmethod=marker:

echo "sourced .zshrc"


# history {{{

# history in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# }}}

# completion {{{

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# include hidden files in autocomplete
_comp_options+=(globdots)

# }}}

# prompt {{{

# enable colors and change prompt
autoload -U colors && colors
source $BINPATH/git_prompt
setopt PROMPT_SUBST

# PROMPT='%{${ret_status}%}%{$fg[blue]%}[%~]%{$fg[magenta]%}$(__git_ps1) %{$fg[blue]%}$ %{$reset_color%}'

PROMPT='%{${ret_status}%}%{$fg[blue]%}[%~] $ %{$reset_color%}'
RPROMPT='%{$fg[magenta]%}$(__git_ps1)'

# zsh specific env variables
export PROMPT_EOL_MARK=''

# }}}

# keymap {{{

# edit line in vim with ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# keymap/completion-menu {{{

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# }}}

# keymap/vi-mode {{{

export KEYTIMEOUT=20

# enable vi insert mode
# also links the main keymap to the viins keymap
bindkey -v
# remap escape key
bindkey -s jk '\e'

# keymap/vi-mode/cursor {{{

# change cursor shape for different vi modes
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]
	then
		echo -ne '\e[1 q'

	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
		[[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]
	then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select

function zle-line-init {
	echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# }}}

# }}}

# }}}

# load {{{

# load fzf stuff
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# load aliases and bookmarks
[ -f ~/.config/shell/aliases ] && source ~/.config/shell/aliases
[ -f ~/.config/shell/bookmarks ] && source ~/.config/shell/bookmarks

# }}}

# zplug {{{

ZPLUG_HOME=$HOME/.local/src/zplug

source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"
zplug "hlissner/zsh-autopair"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

echo 'loading zplug'

# source plugins and add commands to $PATH
zplug load

# }}}

