
setlocal commentstring=//\ %s
setlocal expandtab

augroup format
	autocmd!
	autocmd BufWritePre * Neoformat
augroup END


