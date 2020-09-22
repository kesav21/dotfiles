
" open relative file in new tab
nnoremap <silent> <Leader>f :call fzf#run({
	\ 'options': '--multi',
	\ 'down': '40%',
	\ 'sink': 'tabnew',
	\ 'source': 'fd -H -tf ".*" .',
	\ })<CR>

" open absolute file in new tab
nnoremap <silent> <Leader>F :call fzf#run({
	\ 'options': '--multi',
	\ 'down': '40%',
	\ 'sink': 'tabnew',
	\ 'source': 'fd -H -tf ".*" ~ \| sed "s\|$HOME\|~\|g"',
	\ })<CR>

" search vim help
nnoremap <silent> <leader>hh :Helptags<cr>

