local configurations = {
	['off'] = [[xrandr \
			--output eDP-1 --off \
			--output HDMI-1 --off \
			--output DP-1 --off \
			--output HDMI-2 --off]],
	['laptop'] = [[xrandr \
		--output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
		--output HDMI-1 --off \
		--output DP-1 --off \
		--output HDMI-2 --off]],
	['laptop + tv above'] = [[xrandr \
		--output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal \
		--output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
		--output DP-1 --off \
		--output HDMI-2 --off]],
	['laptop + monitor above'] = [[xrandr \
		--output eDP-1 --mode 1920x1080 --pos 320x1440 --rotate normal \
		--output HDMI-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal \
		--output DP-1 --off \
		--output HDMI-2 --off]],
}
