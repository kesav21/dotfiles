
alias clear='echo "you stop that"'

alias ls="ls -AlF --color=always"

alias settings="sudo env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

alias nuke="rm -rf"

function path() {
  sed 's/:/\n/g' <<< "$PATH"
}

function refresh() {
  xrdb -merge ~/.Xresources
  exit
}

alias gnome-control-center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

alias r="ranger"

# config file shortcuts

# alias cfv="vim ~/.vimrc"
# alias cfx="vim ~/.Xresources"
# alias cft="vim ~/.tmux.conf"
# alias cfbp="vim ~/.profile"
# alias cfbr="vim ~/.bashrc"
# alias cfba="vim ~/.bash_aliases"
# alias cfi="vim ~/.config/i3/config"
# alias cfp="vim ~/.config/polybar/config"
# alias cfrc="vim ~/.config/ranger/rc.conf"
# alias cfrr="vim ~/.config/ranger/rifle.conf"
# alias cfro="vim ~/.config/rofi/config"
# alias cfz="vim ~/.config/zathura/zathurarc"

