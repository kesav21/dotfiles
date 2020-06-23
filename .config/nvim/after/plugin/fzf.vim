
" open file in new tab
nnoremap <silent> <Leader>f :call fzf#run({
	\ 'options': '--multi',
	\ 'down': '40%',
	\ 'sink': 'tabnew'
	\ })<CR>
" search vim help
nnoremap <silent> <leader>hh :Helptags<cr>

