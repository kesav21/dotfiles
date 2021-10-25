
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

## logs

Logs are stored in `$XDG_CACHE_HOME/bin`.

## todo

- figure out why lock screen freezes
- integrate bitwarden into workflow
- integrate xdg-open into workflow
	* drawback: xdg-open can't handle multiple files
- eliminate the need for pavucontrol
	* switch all sink-inputs to newest sink automatically
	* display volume of newest sink
	* change volume of newest sink
