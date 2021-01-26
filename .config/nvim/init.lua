-- vim: set foldmethod=marker:

-- set this before creating any mappings
vim.g.mapleader = ' '

require('kesav.plugins')
require('kesav.lsp')
require('kesav.treesitter')
require('kesav.telescope')
require('kesav.statusline')
require('kesav.tabline')

-- options {{{

vim.o.laststatus    = 2
vim.o.updatetime    = 40
vim.o.timeoutlen    = 1000
vim.o.hlsearch      = true
vim.o.incsearch     = true
vim.o.timeout       = true
vim.o.exrc          = true
vim.o.secure        = true
vim.o.termguicolors = true
vim.o.showmode      = false
vim.o.background    = 'dark'
vim.o.inccommand    = 'split'
vim.o.clipboard     = 'unnamedplus'
vim.o.wildmode      = 'longest,list,full'
vim.o.shortmess     = vim.o.shortmess .. 'c'

vim.wo.relativenumber = true
vim.wo.number         = true
vim.wo.cursorline     = true
vim.wo.list           = true
vim.wo.colorcolumn    = '88'
vim.wo.signcolumn     = 'yes'
vim.wo.listchars      = 'tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀'

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax on ]]

-- }}}

-- mappings {{{

function _G.toggle_colorcolumn()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = "88"
	else
		vim.wo.colorcolumn = ""
	end
end

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q' , '<nop>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Y' , 'y$'   , {noremap = true})
vim.api.nvim_set_keymap('n', 'X' , 'xi'   , {noremap = true})
vim.api.nvim_set_keymap('v', 'p' , '"_dP' , {noremap = true})

vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><<c-w><', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>><c-w>>', {noremap = true})

vim.api.nvim_set_keymap('n', '<tab>'  , ':tabnext<cr>'    , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<s-tab>', ':tabprevious<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>e' , ':tabnew <c-r>=expand("%:p:h") . "/"<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cc', ':lua toggle_colorcolumn()<cr>'          , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cp', ':silent !xsel -ib < %<cr>'              , {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>t'   , ':tabedit term://zsh<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<c-\\><c-\\>', '<c-\\><c-n>'            , {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<f1>', ':make<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<f2>', ':!%:p<cr>', {noremap = true})

--- }}}

-- autocommands {{{

-- formatoptions
-- t break the line if it gets too long
-- c break the comment if it gets too long
-- r continue comment after <enter>
-- o continue comment after o or O
-- q format comments?
-- w something about trailing whitespace
-- a auto-format paragraph
-- ac auto-format commented paragraph
-- n indent subsequent lines of numbered lists
-- 2 indent subsequent lines to match indent of second line
-- v break line only at blanks inserted during the current insert command
-- b break line only at blanks inserted before the textwidth and during the current insert command
-- l break line only if line was shorter than textwidth before the current insert command
-- m break at weird characters
-- M ???
-- B ???
-- 1 don't break after a one-letter word
-- ] ???
-- j remove comment leader when joining lines
-- p don't break after period and single space

vim.cmd [[ augroup buffer_local_options ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd FileType * lua vim.bo.tabstop       = 4       ]]
vim.cmd [[ autocmd FileType * lua vim.bo.shiftwidth    = 4       ]]
vim.cmd [[ autocmd FileType * lua vim.bo.softtabstop   = 4       ]]
vim.cmd [[ autocmd FileType * lua vim.bo.expandtab     = false   ]]
vim.cmd [[ autocmd FileType * lua vim.bo.modeline      = true    ]]
vim.cmd [[ autocmd FileType * lua vim.bo.textwidth     = 88      ]]
vim.cmd [[ autocmd FileType * lua vim.bo.formatoptions = 'crqnj' ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup misc ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]
vim.cmd [[ autocmd BufWritePost *bm_dirs,*bm_files !bmgen ]]
vim.cmd [[ autocmd BufWritePost *dunstrc !killall -q dunst; dunst & ]]
vim.cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]
vim.cmd [[ autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup='Visual', timeout=250}) ]]
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd Filetype typescript,javascript,python,sh,haskell,go,java autocmd format BufWritePre <buffer> undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]

local commentstrings = {
	c                    = "// %s",
	cpp                  = "// %s",
	javascript           = "// %s",
	typescript           = "// %s",
	["typescript.react"] = "// %s",
	asm                  = "# %s",
	crontab              = "# %s",
	markdown             = "<!-- %s -->",
	matlab               = "% %s",
	xdefaults            = "! %s",
}

vim.cmd [[ augroup commentstrings ]]
vim.cmd [[ autocmd! ]]
for ft, cms in pairs(commentstrings) do
	vim.cmd(string.format("autocmd FileType %s lua vim.bo.commentstring = '%s'", ft, cms))
end
vim.cmd [[ augroup END ]]

-- }}}

