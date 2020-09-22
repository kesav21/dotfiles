#!/bin/zsh

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
