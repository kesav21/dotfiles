-- vim: set foldmethod=marker:

-- set this before creating any mappings
vim.g.mapleader = ' '

require('kesav.plugins')
require('kesav.lsp')
require('kesav.treesitter')
require('kesav.telescope')
require('kesav.statusline')

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

vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.softtabstop = 4
vim.o.expandtab   = false

vim.wo.relativenumber = true
vim.wo.number         = true
vim.wo.cursorline     = true
vim.wo.list           = true
vim.wo.colorcolumn    = '88'
vim.wo.signcolumn     = 'yes'

vim.bo.modeline    = true

vim.cmd [[ set listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀ ]] -- breaks if done in lua

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax on ]]

-- }}}

-- mappings {{{

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q' , '<nop>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Y' , 'y$'   , {noremap = true})
vim.api.nvim_set_keymap('n', 'X' , 'xi'   , {noremap = true})
vim.api.nvim_set_keymap('v', 'p' , '"_dP' , {noremap = true})

vim.api.nvim_set_keymap('n', '<tab>'  , ':tabnext<cr>'    , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<s-tab>', ':tabprevious<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>e' , ':tabnew <c-r>=expand("%:p:h") . "/"<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cc', ':set colorcolumn=<cr>'                  , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cp', ':silent !xsel -ib < %<cr>'              , {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<f1>', ':make<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<f2>', ':!%:p<cr>', {noremap = true})

--- }}}

-- autocommands {{{

vim.cmd [[ augroup misc ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]
vim.cmd [[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]]
vim.cmd [[ autocmd BufWritePost *bm_dirs,*bm_files !bmgen ]]
vim.cmd [[ autocmd BufWritePost *dunstrc !killall -q dunst; dunst & ]]
vim.cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]
vim.cmd [[ autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup='Visual', timeout=250}) ]]
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd Filetype typescript,javascript,python,sh,haskell,go,java autocmd BufWritePre <buffer> undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup commentstrings ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd FileType c,cpp,javascript,typescript,typescript.react setlocal commentstring=//\ %s ]]
vim.cmd [[ autocmd FileType asm,crontab                                  setlocal commentstring=#\ %s ]]
vim.cmd [[ autocmd FileType markdown                                     setlocal commentstring=<!--\ %s\ --> ]]
vim.cmd [[ autocmd FileType matlab                                       setlocal commentstring=%\ %s ]]
vim.cmd [[ autocmd FileType xdefaults                                    setlocal commentstring=!\ %s ]]
vim.cmd [[ augroup END ]]

-- }}}

