#!/bin/sh

# vim: set foldmethod=marker:

# set up xdg directories {{{

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

export XDG_DOTFILES_DIR="$HOME"/.local/dotfiles
export XDG_SRC_DIR="$HOME"/.local/src
export XDG_BIN_DIR="$HOME"/.local/bin

export XDG_DOCUMENTS_DIR="$HOME"/Documents
export XDG_DOWNLOADS_DIR="$HOME"/Downloads
export XDG_MUSIC_DIR="$HOME"/Music
export XDG_PICTURES_DIR="$HOME"/Pictures

export XDG_ASU_DIR="$HOME"/asu
export XDG_PROJECTS_DIR="$HOME"/projects

# }}}

# move stuff out of $HOME {{{

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

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

export ZPLUG_HOME="$HOME"/.local/src/zplug

# }}}

# path {{{

# add local scripts
bindirs="$(du -L "$XDG_BIN_DIR" --exclude '.git' | cut -f2 | tr '\n' ':')"
export PATH="$bindirs$PATH"

# add ghc
export PATH="$HOME"/.cabal/bin:"$HOME"/.ghcup/bin:"$PATH"

# add stack packages
stack_packages="$(stack path | awk -F"[: ]" '/^bin-path/ {print $3}')"
export PATH="$stack_packages":"$PATH"

# add go binaries
export PATH=/home/kesav/go/bin:"$PATH"

# add my utility files to the lua path
export LUA_PATH="$LUA_PATH;"/home/kesav/.local/src/lua-stdlib/?.lua

# }}}

# set up ssh
eval "$(ssh-agent)" >/dev/null

# start x {{{

systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] &&
	exec startx "$XDG_CONFIG_HOME"/X11/xinitrc >"$XDG_CACHE_HOME"/X11/xinitrc 2>&1

export GPG_TTY="$(tty)"

# }}}
