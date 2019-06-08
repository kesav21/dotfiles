
alias clear='echo "you stop that"'

alias ls="ls -AlF --color=always"

alias nuke="rm -rf"

# get size of directory
alias dirsize="du -h --max-depth=1 | sort -hr"

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
alias z="zathura -d . &"

## temporary functions

# disable () {
# 	sudo systemctl disable lightdm.service
# }

# enable () {
# 	sudo dpkg-reconfigure lightdm
# }

### # testing launching different chrome profiles

# alias gasu="google-chrome --user-data-dir='/home/kesav/.config/google-chrome/Kesav ASU'"
# alias ghome="google-chrome --user-data-dir='/home/kesav/.config/google-chrome/Kesav Home'"
