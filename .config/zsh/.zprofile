#!/bin/sh

# vim: set foldmethod=marker:

# set up xdg directories {{{

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

export XDG_SRC_DIR="$HOME"/.local/src
export XDG_BIN_DIR="$HOME"/sync/projects/dotfiles/.local/bin

export XDG_DOCUMENTS_DIR="$HOME"/Documents
export XDG_DOWNLOADS_DIR="$HOME"/Downloads
export XDG_MUSIC_DIR="$HOME"/Music
export XDG_PICTURES_DIR="$HOME"/Pictures

# }}}

# move stuff out of $HOME {{{

export GNUPGHOME="${XDG_DATA_HOME:-${HOME:-/home/$LOGNAME}/.local/share}/gnupg"

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NVM_DIR="$XDG_DATA_HOME"/nvm

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export TERMINAL=/usr/local/bin/st
export EDITOR=/usr/bin/nvim

export ZPLUG_HOME="$XDG_SRC_DIR"/zplug

# }}}

# path {{{

# add local scripts
BIN_PATH="$(du -L "$XDG_BIN_DIR" --exclude '.git' | cut -f2 | tr '\n' ':')"
export PATH="$BIN_PATH$PATH"

# add ghc
export PATH="$HOME"/.cabal/bin:"$HOME"/.ghcup/bin:"$PATH"

# add stack packages
STACK_PATH="$(stack path | awk -F"[: ]" '/^bin-path/ {print $3}')"
export PATH="$STACK_PATH":"$PATH"

# add go binaries
export PATH="$HOME"/go/bin:"$PATH"

# add cargo binaries
export PATH="$HOME"/.cargo/bin:"$PATH"

# configure lua package path
# becuase luajit is a drop-in replacement for lua 5.1, use the following:
# luarocks --lua-version 5.1 install --local luacheck
eval "$(luarocks --lua-version 5.1 path)"

# add my utility files to the lua path
export LUA_PATH="$LUA_PATH;$HOME"/sync/projects/lua-stdlib/?.lua

# }}}

# set up node version manager
[ -s "$NVM_DIR"/nvm.sh ] && source "$NVM_DIR"/nvm.sh

# set up ssh
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

if [ "$TERM" = linux ]; then
	echo -en "\e]P01d2021" # #1d2021 normal black
	echo -en "\e]P8928374" # #928374 bright black (looks yellow/tan)
	echo -en "\e]P1cc241d" # #cc241d normal red
	echo -en "\e]P9fb4934" # #fb4934 bright red
	echo -en "\e]P298971a" # #98971a normal green (looks yellow/tan)
	echo -en "\e]PAb8bb26" # #b8bb26 bright green (looks yellow/tan)
	echo -en "\e]P3d79921" # #d79921 normal yellow (looks yellow/tan)
	echo -en "\e]PBfabd2f" # #fabd2f bright yellow (looks yellow/tan)
	echo -en "\e]P4458588" # #458588 normal blue
	echo -en "\e]PC83a598" # #83a598 bright blue (looks grey)
	echo -en "\e]P5b16286" # #b16286 normal magenta
	echo -en "\e]PDd3869b" # #d3869b bright magenta (looks grey)
	echo -en "\e]P6689d6a" # #689d6a normal cyan (looks green)
	echo -en "\e]PE8ec07c" # #8ec07c bright cyan (looks yellow/tan)
	echo -en "\e]P7a89984" # #a89984 normal white (looks grey)
	echo -en "\e]PFebdbb2" # #ebdbb2 bright white (looks grey)
	clear
fi

# start x {{{

systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] &&
	exec startx "$XDG_CONFIG_HOME"/X11/xinitrc >"$XDG_CACHE_HOME"/X11/xinitrc 2>&1

export GPG_TTY="$(tty)"

# }}}
