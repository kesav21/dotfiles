-- local function autocmd(arg)
-- 	local event = arg["event"]
-- 	arg["event"] = nil
-- 	return vim.api.nvim_create_autocmd(event, arg)
-- end

-- local has_auto, auto = pcall(require, "auto")
-- if not has_auto then
-- 	print "lua/kesav/lsp.lua: install neovim/nvim-auto"
-- 	return
-- end

local auto = require "kesav.auto"
auto.command {
	event = { "BufNewFile", "BufRead" },
	pattern = { "sxhkdrc.personal", "sxhkdrc.qwerty", "sxhkdrc.colemak" },
	callback = function()
		vim.bo.filetype = "sxhkd"
	end,
}
