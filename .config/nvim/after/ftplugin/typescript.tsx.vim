
setlocal commentstring=//\ %s

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

augroup format
	autocmd!
	autocmd BufWritePre * Neoformat
augroup END

