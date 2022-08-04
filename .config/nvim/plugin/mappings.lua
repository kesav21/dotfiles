if vim.fn.filereadable(vim.fn.expand "$XDG_CACHE_HOME/bin/colemak") == 1 then
	print "perform colemak-specific mappings"

	-- normal mode
	vim.keymap.set("n", "<plug>(slash-after)", "zz")

	vim.keymap.set("n", "h", "n")
	vim.keymap.set("n", "j", "e")
	vim.keymap.set("n", "k", "o")
	vim.keymap.set("n", "l", "i")

	vim.keymap.set("n", "H", "N")
	vim.keymap.set("n", "J", "E")
	vim.keymap.set("n", "K", "O")
	vim.keymap.set("n", "L", "I")

	vim.keymap.set("n", "<c-h>", "<c-o>")
	vim.keymap.set("n", "<c-j>", "<c-e>")
	vim.keymap.set("n", "<c-k>", "<c-i>")
	-- vim.keymap.set("n", "<c-l>", "<c-n>")

	vim.keymap.set("n", "n", "<left>")
	vim.keymap.set("n", "e", "<down>")
	vim.keymap.set("n", "i", "<up>")
	vim.keymap.set("n", "o", "<right>")

	vim.keymap.set("n", "N", "H")
	vim.keymap.set("n", "E", "L")
	vim.keymap.set("n", "I", "J")
	vim.keymap.set("n", "O", "K")

	vim.keymap.set("n", "<leader>e", ":bn<cr>")
	vim.keymap.set("n", "<leader>i", ":bp<cr>")

	vim.keymap.set("n", "<left>", "<nop>")
	vim.keymap.set("n", "<down>", "<nop>")
	vim.keymap.set("n", "<up>", "<nop>")
	vim.keymap.set("n", "<right>", "<nop>")

	-- -- visual mode
	-- vim.keymap.set("v", "h", "n")
	-- vim.keymap.set("v", "j", "e")
	-- vim.keymap.set("v", "k", "o")
	-- vim.keymap.set("v", "l", "i")
	--
	-- vim.keymap.set("v", "H", "N")
	-- vim.keymap.set("v", "J", "E")
	-- vim.keymap.set("v", "K", "O")
	-- vim.keymap.set("v", "L", "I")
	--
	-- vim.keymap.set("v", "n", "<left>")
	-- vim.keymap.set("v", "e", "<down>")
	-- vim.keymap.set("v", "i", "<up>")
	-- vim.keymap.set("v", "o", "<right>")
else
	print "perform qwerty-specific mappings"

	vim.keymap.set("i", "jk", "<esc>")

	vim.keymap.set("n", "<a-j>", "<c-w>w")
	vim.keymap.set("n", "<a-k>", "<c-w>W")
	vim.keymap.set("n", "<a-h>", "<c-w><")
	vim.keymap.set("n", "<a-l>", "<c-w>>")

	vim.keymap.set("n", "<c-j>", ":bn<cr>")
	vim.keymap.set("n", "<c-k>", ":bp<cr>")
end

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "X", "xi")

vim.keymap.set("v", "p", function()
	vim.fn.feedkeys '"_d'
	if vim.fn.col "." == vim.fn.col "$" - 1 then
		vim.fn.feedkeys "p"
	else
		vim.fn.feedkeys "P"
	end
end)

vim.keymap.set("n", "<c-w>w", "<nop>")
vim.keymap.set("n", "<c-w><c-w>", "<nop>")
vim.keymap.set("n", "<leader>cpf", "silent !xsel -ib < %")
vim.keymap.set("n", "<leader>rf", "!%:p")
vim.keymap.set("n", "<leader><leader>x", ":call kesav#save_and_exec()<cr>")
vim.keymap.set("n", "<leader>nf", function()
	vim.api.nvim_feedkeys(
		string.format(
			":edit %s/",
			vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
		),
		"n",
		true
	)
end)
vim.keymap.set("n", "<leader>cc", function()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = "88"
	else
		vim.wo.colorcolumn = ""
	end
end)

vim.keymap.set("t", "<c-\\><c-\\>", "<c-\\><c-n>")

-- make cw consistent with dw, yw, vw
vim.keymap.set("o", "w", function()
	vim.cmd(string.format("normal! %sw", vim.v.count1))
end)
