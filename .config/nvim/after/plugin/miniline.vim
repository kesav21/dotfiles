
function! GetStatusLine()
	return luaeval("require'statusline'.getline()")
endfunction

function! GetTabLine()
	return luaeval("require'tabline'.getline()")
endfunction

setlocal showtabline=2
setlocal tabline=%!GetTabLine()

setlocal noshowmode
setlocal laststatus=2

augroup status
	autocmd!
	autocmd BufEnter * setlocal statusline=%!GetStatusLine()
augroup END

