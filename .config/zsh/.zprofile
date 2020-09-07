#!/bin/sh

echo 'sourced zprofile'

source ~/.config/shell/vars && echo 'sourced vars'

# add local scripts to PATH
bindirs="$(fd -td . $XDG_BIN_DIR | tr '\n' ':')"
export PATH="$XDG_BIN_DIR:$bindirs$PATH"

# add ghc to path
export PATH="$HOME"/.cabal/bin:"$HOME"/.ghcup/bin:"$PATH"

systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] &&
	exec startx "$XDG_CONFIG_HOME"/X11/xinitrc

export GPG_TTY="$(tty)"
