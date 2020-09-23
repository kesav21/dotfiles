#!/bin/sh

source ~/.config/shell/vars

# add local scripts to PATH
bindirs="$(du "$XDG_BIN_DIR" --exclude '.git' | cut -f2 | tr '\n' ':')"
export PATH="$bindirs$PATH"

# add ghc to path
export PATH="$HOME"/.cabal/bin:"$HOME"/.ghcup/bin:"$PATH"

systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] &&
	exec startx "$XDG_CONFIG_HOME"/X11/xinitrc

export GPG_TTY="$(tty)"
