
alias clear='echo "you stop that"'

alias ls="ls -AlF --color=always"

alias nuke="rm -rf"

function path() {
	sed 's/:/\n/g' <<< "$PATH"
}

function refresh() {
	xrdb -merge ~/.Xresources
	exit
}

# alias gnome-control-center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
# alias settings="sudo env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

alias r="ranger"
alias n="nmtui"

