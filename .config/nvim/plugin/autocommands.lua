local auto = require "kesav.auto"
local formatter = require "kesav.formatter"
local highlight = require "vim.highlight"

local format = auto.group "format"
format {
	event = { "BufWritePost" },
	pattern = { "*" },
	callback = formatter.format,
}

local misc = auto.group "misc"
-- misc {
-- 	event = { "BufWritePre" },
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.cmd [[%s/\s\+$//e]]
-- 	end,
-- }
misc {
	event = { "BufWritePost" },
	pattern = { "*dunstrc" },
	callback = function()
		vim.cmd [[silent !killall -q dunst; dunst &]]
	end,
}
misc {
	event = { "BufWritePost" },
	pattern = { "*sxhkdrc*" },
	callback = function()
		vim.cmd [[silent !pkill -USR1 sxhkd]]
	end,
}
misc {
	event = { "BufWritePost" },
	pattern = { "*bspwmrc" },
	callback = function()
		vim.cmd [[silent !source %]]
	end,
}
misc {
	event = { "TextYankPost" },
	pattern = { "*" },
	callback = function()
		highlight.on_yank {
			higroup = "Visual",
			timeout = 250,
		}
	end,
}

vim.cmd [[
	augroup packer_compile
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]]
