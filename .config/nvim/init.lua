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

-- verb se fo?
-- http://vimcasts.org/episodes/meet-the-arglist/
-- nvim +scriptnames +q --headless -- kk.lua 2>&1 |
-- 	awk -v RS='\r\n' -F': ' '{print $2}'

-- set this before creating any mappings
vim.g.mapleader = " "
-- required by colorizer
if os.getenv "TERM" ~= "linux" then
	vim.o.termguicolors = true
end
-- use ale's linting only
vim.g.ale_disable_lsp = 1

safe_require "kesav.plugins"
safe_require "kesav.completion"
safe_require "kesav.lsp"
safe_require "kesav.treesitter"
safe_require "kesav.telescope"
safe_require "kesav.comment"
safe_require "kesav.statusline"
safe_require "kesav.tabline"
safe_require_setup "kesav.formatter"

-- TODO: decide mappings for this
-- local nnoremap = vim.keymap.nnoremap
-- nnoremap { "<space>tsw", signs.toggle_word_diff }
-- nnoremap { "<space>tsh", signs.toggle_word_diff }
