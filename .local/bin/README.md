
# scripts

These are the scripts I use to automate miscellaneous things on my machine.
I use the dash shell, but (almost) all scripts are POSIX compliant.

## recommended usage

Create a folder (I use `~/.local/bin`).
Add these scripts to that folder.
Add that folder to `$PATH`.

## configuration

Some scripts require config files.
These config files are expected to be in `$XDG_CONFIG_HOME/bin`.

- resetmon: `"$XDG_CONFIG_HOME"/bin/screenlayout`
- firefox2: `"$XDG_CONFIG_HOME"/bin/firefox2`

## logs

Logs are stored in `$XDG_CACHE_HOME/bin`.

## todo

- audio
	* write script to set port to headphones
	* write script to set port to speakers
	* write script to set profile to analog stereo duplex
	* write script to set profile to digital stereo (hdmi) output
- figure out why lock screen freezes

