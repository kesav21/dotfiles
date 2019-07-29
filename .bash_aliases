
alias clear='echo "you stop that"'

alias ll="ls -AlF --color=always"

alias nuke="rm -rf"

# get size of directory
alias dirsize="du -h --max-depth=1 | sort -hr"

# alias gnome-control-center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
# alias settings="sudo env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

alias f="vifm . ~"
alias n="nmtui"
alias v="nvim"
alias z="zathura -d . &"
alias t="tree -a -I '.git'"

# git shortcuts

alias gis="git status"
alias gid="git diff"
alias gia="git add"
alias gil="git add ."
alias gic="git commit"
alias gip="git push"


function path() {
	sed 's/:/\n/g' <<< "$PATH"
}

function refresh() {
	xrdb -merge ~/.Xresources
	exit
}

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
