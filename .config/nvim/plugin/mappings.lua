local mappings = {
	--
	n = "h",
	e = "j",
	i = "k",
	o = "l",
	--
	h = "i",
	j = "e",
	k = "o",
	l = "n",
}

local modes = { "n", "x", "o" }

local transformations = {
	function(s)
		return s
	end,
	function(s)
		return string.upper(s)
	end,
	function(s)
		return "g" .. s
	end,
	function(s)
		return "g" .. string.upper(s)
	end,
	function(s)
		return "<c-" .. s .. ">"
	end,
	function(s)
		return "<c-w>" .. s
	end,
}

for lhs, rhs in pairs(mappings) do
	for _, mode in ipairs(modes) do
		for _, f in ipairs(transformations) do
			vim.keymap.set(mode, f(lhs), f(rhs))
		end
	end
end

-- special cases
vim.cmd [[
onoremap e <nop>
onoremap i <nop>
nnoremap go <Plug>LionRight
xnoremap go <Plug>VLionRight
onoremap go <nop>
nnoremap gO <Plug>LionLeft
xnoremap gO <Plug>VLionLeft
onoremap gO <nop>
xnoremap <silent> <expr> H (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")|
xnoremap <silent> <expr> A (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")|
]]

vim.keymap.set("n", "<leader>e", ":bn<cr>")
vim.keymap.set("n", "<leader>i", ":bp<cr>")
vim.keymap.set("n", "<c-w>w", "<nop>")
vim.keymap.set("n", "<c-w><c-w>", "<nop>")
vim.keymap.set("n", "<leader>cpf", "silent !xsel -ib < %")
vim.keymap.set("n", "<leader>rf", "!%:p")

-- vim.keymap.set("n", "<leader><leader>x", ":call kesav#save_and_exec()<cr>")
vim.keymap.set("n", "<leader><leader>x", function()
	if vim.bo.filetype == "vim" then
		vim.cmd [[silent! write]]
		vim.cmd [[source %]]
	elseif vim.bo.filetype == "lua" then
		vim.cmd [[silent! write]]
		vim.cmd [[luafile %]]
	end
end)

vim.keymap.set("n", "<leader>newf", function()
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

-- replace currently selected text with default register without yanking it
-- https://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
vim.cmd [[vnoremap p "_dP]]

local function do_word_motion(wordmotion, endmotion)
	return function()
		local before = vim.fn.line "."
		vim.fn.execute("normal! v" .. vim.v.count1 .. wordmotion)
		if vim.fn.line "." ~= before then
			local target = vim.fn.winsaveview()
			vim.pretty_print(target)
			local before2 = vim.fn.line "."
			vim.fn.execute("normal! g" .. endmotion)
			if vim.fn.line "." ~= before2 then
				return
			else
				vim.fn.winrestview(target)
			end
		end
		vim.fn.execute "normal! h"
	end
end

vim.keymap.set("o", "w", do_word_motion("w", "e"))
vim.keymap.set("o", "W", do_word_motion("W", "E"))

-- vim.cmd [[
-- function s:DoWordMotion(wordmotion, endmotion)
-- 	let before = line('.')
-- 	execute 'normal! v'.v:count1.a:wordmotion
--
-- 	" when the cursor wraps, we must check whether it went too far
-- 	if line('.') != before
-- 		" try backing up to the end of the previous word
-- 		" and then see if we stay on the same line
-- 		let target = winsaveview()
-- 		let before = line('.')
-- 		exe 'normal! g'.a:endmotion
-- 		if line('.') != before
-- 			" we are now at the end of the word at the end of previous line,
-- 			" which is exactly where we want to be
-- 			return
-- 		else
-- 			" we were (almost) in the right place, so go back there
-- 			call winrestview(target)
-- 		endif
-- 	endif
--
-- 	" visual selections are inclusive; to avoid erasing the first char
-- 	" of the following word, we must back off one column
-- 	execute 'normal! h'
-- endfunction
--
-- onoremap <silent> w :<C-U>call <SID>DoWordMotion('w','e')<CR>
-- onoremap <silent> W :<C-U>call <SID>DoWordMotion('W','E')<CR>
-- ]]
