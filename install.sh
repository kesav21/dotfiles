#!/bin/bash

DIR=~/Projects/dotfiles

declare -a StringArray=(\
	.bash_aliases\
	.bashrc\
	.profile\
	.tmux.conf\
	.vimrc\
	.Xresources\
	.wallpaper\
)

for val in ${StringArray[@]}; do
	rm ~/$val
	ln -sv $DIR/$val ~/$val
done

# rm ~/.bash_aliases
# rm ~/.bashrc
# rm ~/.profile

# rm ~/.tmux.conf

# rm ~/.vimrc

# rm ~/.Xresources

# rm ~/.wallpaper

# ln -sv $DIR/.bash_aliases ~/.bash_aliases
# ln -sv $DIR/.bashrc ~/.bashrc
# ln -sv $DIR/.profile ~/.profile

# ln -sv $DIR/.tmux.conf ~/.tmux.conf

# ln -sv $DIR/.vimrc ~/.vimrc

# ln -sv $DIR/.Xresources ~/.Xresources

# ln -sv $DIR/.wallpaper ~/.wallpaper

