
# vim: set foldmethod=marker:

# aliases {{{

alias f="vifm . ~"
alias n="nmtui"
alias v="nvim"
alias z="zathura -d . &"
alias t="tree -a -I '.git'"

alias clear='echo "you stop that"'
alias ll="ls -AlF --color=always"
alias nuke="rm -rf"
alias ytdl="youtube-dl -f bestaudio"

alias mone="~/.bin/monitor_extend"
alias mond="~/.bin/monitor_disconnect"

# aliases/git {{{

alias gis="git status"
alias gid="git diff"
alias gia="git add"
alias gil="git add ."
alias gic="git commit"
alias gip="git push"

# }}}

# aliases/chrome {{{

# testing launching different chrome profiles
# alias gasu="google-chrome --user-data-dir='/home/kesav/.config/google-chrome/Kesav ASU'"
# alias ghome="google-chrome --user-data-dir='/home/kesav/.config/google-chrome/Kesav Home'"

# }}}

# }}}

# functions {{{

# get size of directory
dirsize () {
	du -h --max-depth=1 | sort -hr
}

# print out path neatly
path () {
	sed 's/:/\n/g' <<< "$PATH"
}

# reload Xresources
refresh () {
	xrdb -merge ~/.Xresources
	exit
}

# }}}

