
# vim: set foldmethod=marker:

# aliases {{{

# aliases/misc {{{

alias v='nvim $(fzf -m)'
alias nv='nvim'
alias vf="~/.local/bin/vifm_run . ~"
alias nm="nmtui"
alias zf='zathura $(fzf) &'
alias zd="zathura -d . &"
alias t="tree -a -I '.git|__pycache__|.pytest_cache|.env'"

alias ll="ls -AlF --color=always"
alias nuke="rm -rf"

alias ytu="sudo youtube-dl -U"
alias yta="youtube-dl -f bestaudio"

alias me="~/.local/bin/monitor_extend"
alias md="~/.local/bin/monitor_disconnect"

alias mi="sudo make install"
alias mic="sudo make install && make clean"

alias vc="virtualenv -p $(which python3) .env"
alias va="source .env/bin/activate"
alias vd="deactivate"

 # }}}

# aliases/git {{{

alias gis="clear && git status"
alias gic="git commit"
alias gip="git push"

alias gid="git diff"
# git diff unstaged file
alias gidf='clear && git diff $(git diff --name-only | fzf -m)'

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

# aliases/firefox {{{

alias fa="firefox -P asu &"
alias fh="firefox -P default &"

# }}}


# }}}

# functions {{{

# functions/fzf {{{

#
# ex: f less -> less $(fzf)
#
f () {
	$1 $(fzf)
}

#
# ex: f less -> less $(fzf -m)
#
fm () {
	$1 $(fzf -m)
}

# }}}

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

