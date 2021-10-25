if not vim.keymap then
	print "plugin/mappings.lua: install tjdevries/astronauta.nvim"
	return
end

local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local vnoremap = vim.keymap.vnoremap
local tnoremap = vim.keymap.tnoremap
local onoremap = vim.keymap.onoremap

inoremap { "jk", "<esc>" }
nnoremap { "Q", "<nop>" }
nnoremap { "Y", "y$" }
nnoremap { "X", "xi" }

local function visual_paste()
	vim.fn.feedkeys '"_d'
	if vim.fn.col "." == vim.fn.col "$" - 1 then
		vim.fn.feedkeys "p"
	else
		vim.fn.feedkeys "P"
	end
end
vnoremap { "p", visual_paste }

nnoremap { "<c-w>w", "<nop>" }
nnoremap { "<c-w><c-w>", "<nop>" }
nnoremap { "<a-j>", "<c-w>w" }
nnoremap { "<a-k>", "<c-w>W" }
nnoremap { "<a-h>", "<c-w><" }
nnoremap { "<a-l>", "<c-w>>" }

nnoremap { "<c-j>", ":bn<cr>" }
nnoremap { "<c-k>", ":bp<cr>" }

tnoremap { "<c-\\><c-\\>", "<c-\\><c-n>" }

-- make cw consistent with dw, yw, vw
local function consistent_cw()
	vim.cmd(string.format("normal! %sw", vim.v.count1))
end
onoremap { "w", consistent_cw }
