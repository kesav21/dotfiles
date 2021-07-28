-- set this before creating any mappings
vim.g.mapleader = ' '
-- required by colorizer
vim.o.termguicolors = true
-- use ale's linting only
vim.g.ale_disable_lsp = 1

-- http://vimcasts.org/episodes/meet-the-arglist/

local function safe_require(module)
	local ok, _ = pcall(require, module)
	if not ok then
		print(string.format([[init.lua: require("%s") failed]], module))
	end
end

local function safe_require_setup(module_name)
	local ok, module = pcall(require, module_name)
	if not ok then
		print(string.format([[init.lua: require("%s") failed]], module_name))
	else
		local ok2, _ = pcall(module.setup)
		if not ok2 then
			print(string.format([[init.lua: %s.setup() failed]], module_name))
		end
	end
end

safe_require('kesav.plugins')
safe_require('astronauta.keymap')
safe_require_setup('colorizer')
safe_require_setup('gitsigns')
safe_require('kesav.lsp')
safe_require('kesav.treesitter')
safe_require('kesav.telescope')
safe_require('kesav.statusline')
safe_require('kesav.tabline')
safe_require_setup('kesav.formatter')
