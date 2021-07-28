if not vim.keymap then
	print("plugin/mappings.lua: install tjdevries/astronauta.nvim")
	return
end

local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local vnoremap = vim.keymap.vnoremap
local tnoremap = vim.keymap.tnoremap
local onoremap = vim.keymap.onoremap

inoremap { 'jk', '<esc>' }
nnoremap { 'Q' , '<nop>' }
nnoremap { 'Y' , 'y$' }
nnoremap { 'X' , 'xi' }
vnoremap { 'p' , '"_dP' }

nnoremap { '<c-j>' , '<c-w>w' }
nnoremap { '<c-k>' , '<c-w>W' }

-- Make cw consistent with dw, yw, vw
vim.cmd [[onoremap w :execute 'normal! '.v:count1.'w'<CR>]]

nnoremap { '<leader>e' , ':e <c-r>=expand("%:p:h") . "/"<cr>' }
nnoremap { '<leader>cp', ':silent !xsel -ib < %<cr>'              }

nnoremap { '<leader>t'   , ':edit term://zsh<cr>:set hidden<cr>' }
tnoremap { '<c-\\><c-\\>', '<c-\\><c-n>' }

nnoremap { '<f1>', ':make<cr>' }
nnoremap { '<f2>', ':!%:p<cr>' }

local function toggle_colorcolumn()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = "88"
	else
		vim.wo.colorcolumn = ""
	end
end
nnoremap { '<leader>cc', toggle_colorcolumn }
