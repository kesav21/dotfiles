
echo "sourced .zshrc"

# enable colors and change prompt
autoload -U colors && colors
source $BINPATH/git_prompt
setopt PROMPT_SUBST
PS1='$fg[blue][%~]$fg[magenta]$(__git_ps1 " (%s)")$fg[blue] \$ %{$reset_color%}'

# history in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
	zmodload zsh/complist
	compinit
	_compt_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# change cursor shape for different vi modes
	function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] ||
			[[ $1 = 'block' ]]; then
				echo -ne '\e[1 q'
			elif [[ ${KEYMAP} == main ]] ||
				[[ ${KEYMAP} == viins ]] ||
				[[ ${KEYMAP} = '' ]] ||
				[[ $1 = 'beam' ]]; then
					echo -ne '\e[5 q'
				fi
			}
		zle -N zle-keymap-select
			zle-line-init() {
			zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
				echo -ne "\e[5 q"
			}
		zle -N zle-line-init
		echo -ne '\e[5 q' # Use beam shape cursor on startup.
		preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# load aliases and bookmarks
[ -f ~/.config/shell/aliases ] && . ~/.config/shell/aliases
[ -f ~/.config/shell/bookmarks ] && . ~/.config/shell/bookmarks

# enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

