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
vnoremap { "p", '"_dP' }

nnoremap { "<c-w>w", "<nop>" }
nnoremap { "<c-w><c-w>", "<nop>" }

nnoremap { "<c-j>", ":bn<cr>" }
nnoremap { "<c-k>", ":bp<cr>" }

nnoremap { "<c-h>", "<c-w><" }
nnoremap { "<c-l>", "<c-w>>" }

tnoremap { "<c-\\><c-\\>", "<c-\\><c-n>" }

-- make cw consistent with dw, yw, vw
local function consistent_cw()
	vim.cmd(string.format("normal! %sw", vim.v.count1))
end
onoremap { "w", consistent_cw }
