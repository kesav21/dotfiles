if not vim.keymap then
	print("plugin/mappings.lua: install tjdevries/astronauta.nvim")
	return
end

local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local vnoremap = vim.keymap.vnoremap
local onoremap = vim.keymap.onoremap

inoremap { 'jk', '<esc>' }
nnoremap { 'Q' , '<nop>' }
nnoremap { 'Y' , 'y$' }
nnoremap { 'X' , 'xi' }
vnoremap { 'p' , '"_dP' }

nnoremap { '<c-j>' , '<c-w>w' }
nnoremap { '<c-k>' , '<c-w>W' }

-- make cw consistent with dw, yw, vw
local function consistent_cw()
	vim.fn.execute("normal! " .. vim.v.count1 .. "w")
end
onoremap { 'w', consistent_cw }
