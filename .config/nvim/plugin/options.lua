-- some options do not report file of last modification on :verbose set?
-- https://github.com/neovim/neovim/issues/6561

vim.o.laststatus = 2
vim.o.updatetime = 40
vim.o.timeoutlen = 1000
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.timeout = true
vim.o.exrc = true
vim.o.secure = true
vim.o.showmode = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.background = "dark"
vim.o.inccommand = "split"
vim.o.clipboard = "unnamedplus"
vim.o.wildmode = "longest,list,full"
vim.o.shortmess = vim.o.shortmess .. "c"
-- breaks if done on window-scope
vim.o.listchars = "tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀"
vim.o.backspace = "indent,eol,start,nostop"
vim.o.backup = false
vim.o.writebackup = false
vim.o.mouse = ""

vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true
vim.o.list = true
vim.o.colorcolumn = "88"
vim.o.signcolumn = "yes"
vim.o.wrap = false

-- breaks if done on buffer-scope
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false
vim.o.modeline = true
vim.o.fixendofline = false
vim.o.textwidth = 88

local auto = require "kesav.auto"

-- local commentstrings = auto.group "commentstrings"
-- commentstrings {
-- 	event = { "Filetype" },
-- 	pattern = { "c", "cpp", "javascript", "typescript", "typescript.react" },
-- 	callback = function()
-- 		vim.bo.commentstring = "// %s"
-- 	end,
-- }
-- commentstrings {
-- 	event = { "Filetype" },
-- 	pattern = { "asm", "toml", "crontab", "desktop" },
-- 	callback = function()
-- 		vim.bo.commentstring = "# %s"
-- 	end,
-- }
-- commentstrings {
-- 	event = { "Filetype" },
-- 	pattern = { "markdown" },
-- 	callback = function()
-- 		vim.bo.commentstring = "<!-- %s -->"
-- 	end,
-- }
-- commentstrings {
-- 	event = { "Filetype" },
-- 	pattern = { "matlab" },
-- 	callback = function()
-- 		vim.bo.commentstring = "% %s"
-- 	end,
-- }
-- commentstrings {
-- 	event = { "Filetype" },
-- 	pattern = { "xdefaults" },
-- 	callback = function()
-- 		vim.bo.commentstring = "! %s"
-- 	end,
-- }

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
--
-- override the formatoptions set by runtime/ftplugin
--
local setfo = auto.group "setfo"
setfo {
	event = { "Filetype" },
	pattern = { "*" },
	callback = function()
		vim.bo.formatoptions = "crqj"
	end,
}
