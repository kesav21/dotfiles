
# add local scripts to PATH

bindir="/home/kesav/.local/bin"
bin_in_path=$(echo "$PATH" | grep "$bindir")

# if bin is not in path
if [ -z "$bin_in_path" ]
then
	# add bin to path
	PATH="$PATH:$bindir"
fi

# set environment variables

export EDITOR=/usr/bin/nvim

# update bash prompt

PS1='\[\033]0;[\u] $PWD\007\]'  # set window title
PS1="$PS1"'\[\033[34m\]'        # set color to blue
PS1="$PS1"'[\w]'                  # current working directory
PS1="$PS1"'\[\033[35m\]'        # set color to purple
# PS1="$PS1"'`__git_ps1`'         # git branch
PS1="$PS1"'\[\033[34m\]'        # set color to blue
# PS1="$PS1"'\[\033[0m\]'         # reset color
PS1="$PS1"' $ '                 # prompt: $
PS1="$PS1"'\[\033[0m\]'         # reset color

# alias definitions

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# bookmarked shortcuts

[ -f ~/.bash_shortcuts ] && . ~/.bash_shortcuts

# set fzf to exclude
# hidden git files
# __pycache__ files
# hidden pytest files
# virtual environment files
export FZF_DEFAULT_COMMAND='find . -type f | grep -v '\.git/' | grep -v '__pycache__/' | grep -v '\.pytest_cache' | grep -v '\.env''

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]
then
	tmux a -t default || tmux new -s default
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

