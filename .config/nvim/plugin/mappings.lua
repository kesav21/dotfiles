vim.cmd [[

" :h index

" neio
nnoremap n h| xnoremap n h| onoremap n h|
nnoremap e j| xnoremap e j| onoremap e <nop>|
nnoremap i k| xnoremap i k| onoremap i <nop>|
nnoremap o l| xnoremap o l| onoremap o l|

nnoremap N H| xnoremap N H| onoremap N H|
nnoremap E J| xnoremap E J| onoremap E J|
nnoremap I K| xnoremap I K| onoremap I K|
nnoremap O L| xnoremap O L| onoremap O L|

nnoremap gn gh| xnoremap gn gh| onoremap gn gh| " start select mode
nnoremap ge gj| xnoremap ge gj| onoremap ge gj| " like j, but when wrap on go N screen lines down
nnoremap gi gk| xnoremap gi gk| onoremap gi gk| " like k, but when wrap on go N screen lines up
nnoremap go <Plug>LionRight| xnoremap go <Plug>VLionRight| onoremap go <nop>| " aligns with vim-lion

nnoremap gN gH| xnoremap gN gH| onoremap gN gH| " start select line mode
nnoremap gE gJ| xnoremap gE gJ| onoremap gE gJ| " join lines without inserting space 
nnoremap gI gK| xnoremap gI gK| onoremap gI gK| " joins line with split-join
nnoremap gO <Plug>LionLeft| xnoremap gO <Plug>VLionLeft| onoremap gO <nop>| " aligns with vim-lion

nnoremap <c-n> <c-h>| xnoremap <c-n> <c-h>|
nnoremap <c-e> <c-j>| xnoremap <c-e> <c-j>|
nnoremap <c-i> <c-k>| xnoremap <c-i> <c-k>|
nnoremap <c-o> <c-l>| xnoremap <c-o> <c-l>|

nnoremap <c-w>n <c-w>h| xnoremap <c-w>n <c-w>h|
nnoremap <c-w>e <c-w>j| xnoremap <c-w>e <c-w>j|
nnoremap <c-w>i <c-w>k| xnoremap <c-w>i <c-w>k|
nnoremap <c-w>o <c-w>l| xnoremap <c-w>o <c-w>l|

" visual mode
xnoremap <silent> <expr> L (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")|
xnoremap <silent> <expr> A (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")|

" hjkl
nnoremap h i| xnoremap h i| onoremap h i| " insert at cursor
nnoremap j e| xnoremap j e| onoremap j e| " forward, end of word
nnoremap k o| xnoremap k o| onoremap k o| " insert line below
nnoremap l n| xnoremap l n| onoremap l n| " go to next match

nnoremap H I| xnoremap H I| onoremap H I| " insert at start of line
nnoremap J E| xnoremap J E| onoremap J E| " forward, end of WORD
nnoremap K O| xnoremap K O| onoremap K O| " insert line above
nnoremap L N| xnoremap L N| onoremap L N| " go to previous match

nnoremap gh gI| xnoremap gh gI| onoremap gh gI| " like I, but always start in column 1
nnoremap gj ge| xnoremap gj ge| onoremap gj ge| " go backward to the end of the previous word
nnoremap gk go| xnoremap gk go| onoremap gk go| " cursor to byte N in the buffer
nnoremap gl gn| xnoremap gl gn| onoremap gl gn| " select the next match

nnoremap gH gi| xnoremap gH gi| onoremap gH gi| " like i, but first move to the \|'^\| mark
nnoremap gJ gE| xnoremap gJ gE| onoremap gJ gE| " go backward to the end of the previous WORD
nnoremap gK gO| xnoremap gK gO| onoremap gK gO| " shows table of contents in :h
nnoremap gL gN| xnoremap gL gN| onoremap gL gN| " select the previous match

nnoremap <c-h> <c-i>| xnoremap <c-h> <c-i>|
nnoremap <c-j> <c-e>| xnoremap <c-j> <c-e>|
nnoremap <c-k> <c-o>| xnoremap <c-k> <c-o>|
nnoremap <c-l> <c-n>| xnoremap <c-l> <c-n>|

]]

vim.keymap.set("n", "<leader>e", ":bn<cr>")
vim.keymap.set("n", "<leader>i", ":bp<cr>")

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
