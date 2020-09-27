
setlocal expandtab
setlocal colorcolumn=88

augroup format
	autocmd!
	autocmd BufWritePre * Neoformat
augroup END

