
# vim: set foldmethod=marker:

# aliases {{{

alias v='nvim $(fzf -m)'
alias nv='nvim'
alias vf="vifm . ~"
alias nm="nmtui"
alias zf='zathura $(fzf) &'
alias zd="zathura -d . &"
alias t="tree -a -I '.git|__pycache__'"

alias ll="ls -AlF --color=always"
alias nuke="rm -rf"
alias yta="youtube-dl -f bestaudio"

alias me="~/.bin/monitor_extend"
alias md="~/.bin/monitor_disconnect"

alias mi="sudo make install"
alias mic="sudo make install && make clean"

# aliases/git {{{

alias gis="git status"
alias gic="git commit"
alias gip="git push"

alias gid="git diff"
# git diff unstaged file
alias gidf='git diff $(git diff --name-only | fzf -m)'

alias gia="git add"
alias giaa="git add ."

# git add unstaged/untracked file

giaf () {
	all=$(git diff --name-only && git ls-files --others --exclude-standard)
	git add $(printf '%s\n' "${all[@]}" | fzf -m)
}

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

