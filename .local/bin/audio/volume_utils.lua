local errors = require "kk.errors"
local fileio = require "kk.fileio"

local function getenv(name)
	local value = os.getenv(name)
	if not value then
		errors.format([[could not find environment variable "%s"]], name)
	end
	return value
end

local function parse_diff(arguments)
	local argument = arguments[1]
	if not argument then
		errors.format "no arguments given"
	end

	local first = string.sub(argument, 1, 1)
	if first ~= "+" and first ~= "-" then
		errors.format(
			[[argument must start with either a "+" or a "-", not a "%s"]],
			first
		)
	end

	local last = string.sub(argument, -1)
	if last ~= "%" then
		errors.format([[argument must end in "%%" not "%s"]], last)
	end

	local middle_raw = string.sub(argument, 1, -2)
	local middle = tonumber(middle_raw)
	if not middle then
		errors.format([[argument must contain a number, not "%s"]], middle_raw)
	end

	return middle
end

local function validate_change(current, diff)
	if diff == 0 then
		errors.format([[requested change "%s%%" cannot be "0%%"]], diff)
	end
	if current == 0 and diff < 0 then
		errors.format(
			[[change "%s%%" would push volume "%s%%" over limit "0%%"]],
			diff,
			current
		)
	end
	if current == 100 and diff > 0 then
		errors.format(
			[[change "+%s%%" would push volume "%s%%" over limit "100%%"]],
			diff,
			current
		)
	end
end

local M = {}

function M.change_volume(diff)
	-- local diff = errors.passthrough(parse_diff, arg)
	local cache = errors.passthrough(getenv, "XDG_CACHE_HOME")
	local newest = errors.passthrough(
		fileio.read_number,
		string.format("%s/bin/pamonitor.index", cache)
	)
	local current = errors.passthrough(
		fileio.read_number,
		string.format("%s/bin/pamonitor.volume", cache)
	)
	errors.passthrough(validate_change, current, diff)
	local status = errors.passthrough(
		os.execute,
		-- string.format("pactl set-sink-volume %d %s", newest, arg[1])
		string.format("pactl set-sink-volume %s +%s%%", newest, diff)
	)
	if status ~= 0 then
		errors.format([[exited with non-zero status "%s"]], status)
	end
end

-- local ok, module = pcall(require, "volume_utils")
-- if not ok then
-- 	io.stderr:write(module)
-- 	os.exit(1)
-- end
-- local ok, err = pcall(module.change_volume, 5)
-- if not ok then
-- 	io.stderr:write(err)
-- 	os.exit(1)
-- end

return M

-- alsa_card.pci-0000_2b_00.1 TU116 High Definition Audio Controller
-- output:hdmi-stereo         Digital Stereo (HDMI) Output
-- output:hdmi-stereo-extra3  Digital Stereo (HDMI 4) Output
-- speakers
-- pacmd set-card-profile alsa_card.pci-0000_2b_00.1 output:hdmi-stereo
-- headphones
-- pacmd set-card-profile alsa_card.pci-0000_2b_00.1 output:hdmi-stereo-extra3
