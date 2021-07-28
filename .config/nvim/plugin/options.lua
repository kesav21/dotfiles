-- some options do not report file of last modification on :verbose set?
-- https://github.com/neovim/neovim/issues/6561

vim.o.laststatus    = 2
vim.o.updatetime    = 40
vim.o.timeoutlen    = 1000
vim.o.hlsearch      = true
vim.o.incsearch     = true
vim.o.timeout       = true
vim.o.exrc          = true
vim.o.secure        = true
vim.o.showmode      = false
vim.o.splitbelow    = true
vim.o.splitright    = true
vim.o.background    = 'dark'
vim.o.inccommand    = 'split'
vim.o.clipboard     = 'unnamedplus'
vim.o.wildmode      = 'longest,list,full'
vim.o.shortmess     = vim.o.shortmess .. 'c'
-- breaks if done on window-scope
vim.o.listchars     = 'tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀'
vim.o.backspace     = 'indent,eol,start,nostop'

vim.wo.relativenumber = true
vim.wo.number         = true
vim.wo.cursorline     = true
vim.wo.list           = true
vim.wo.colorcolumn    = '88'
vim.wo.signcolumn     = 'yes'

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax on ]]

vim.cmd [[ augroup commentstrings ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd FileType c                lua vim.bo.commentstring = "// %s" ]]
vim.cmd [[ autocmd FileType cpp              lua vim.bo.commentstring = "// %s" ]]
vim.cmd [[ autocmd FileType javascript       lua vim.bo.commentstring = "// %s" ]]
vim.cmd [[ autocmd FileType typescript       lua vim.bo.commentstring = "// %s" ]]
vim.cmd [[ autocmd FileType typescript.react lua vim.bo.commentstring = "// %s" ]]
vim.cmd [[ autocmd FileType asm              lua vim.bo.commentstring = "# %s" ]]
vim.cmd [[ autocmd FileType toml             lua vim.bo.commentstring = "# %s" ]]
vim.cmd [[ autocmd FileType crontab          lua vim.bo.commentstring = "# %s" ]]
vim.cmd [[ autocmd FileType markdown         lua vim.bo.commentstring = "<!-- %s -->" ]]
vim.cmd [[ autocmd FileType matlab           lua vim.bo.commentstring = "% %s" ]]
vim.cmd [[ autocmd FileType xdefaults        lua vim.bo.commentstring = "! %s" ]]
vim.cmd [[ augroup END ]]

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
vim.cmd [[ autocmd FileType * lua vim.bo.fixendofline  = false ]]
vim.cmd [[ autocmd FileType * lua vim.bo.textwidth     = 88      ]]
vim.cmd [[ autocmd FileType * lua vim.bo.formatoptions = 'crqj' ]] -- this doesn't work
vim.cmd [[ augroup END ]]