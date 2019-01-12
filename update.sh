
# copy config files

mkdir ./.config/

mkdir ./.config/i3/
cp ~/.config/i3/config ./.config/i3/config
cp ~/.config/i3/polybar.sh ./.config/i3/polybar.sh

mkdir ./.config/polybar/
cp ~/.config/polybar/config ./.config/polybar/config

mkdir ./.config/ranger/
cp ~/.config/ranger/rc.conf ./.config/ranger/rc.conf

mkdir ./.config/rofi/
cp ~/.config/rofi/config ./.config/rofi/config
cp ~/.config/rofi/nord ./.config/rofi/nord

mkdir ./.config/zathura/
cp ~/.config/zathura/zathurarc ./.config/zathura/zathurarc

# copy mpd config files

mkdir ./.mpd/
cp ~/.mpd/mpd.conf ./.mpd/mpd.conf

# copy ncmpcpp config files

mkdir ./.ncmpcpp/
cp ~/.ncmpcpp/config ./.ncmpcpp/config

# copy fonts and scripts directories

cp -r ~/.fonts/ ./
cp -r ~/.scripts/ ./

# copy other config files

cp ~/.bash_aliases ./.bash_aliases
cp ~/.bashrc ./.bashrc
cp ~/.profile ./.profile
cp ~/.tmux.conf ./.tmux.conf
cp ~/.vimrc ./.vimrc
cp ~/.wallpaper ./.wallpaper
cp ~/.Xresources ./.Xresources

