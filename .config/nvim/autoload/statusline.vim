
function statusline#createcolors()
	hi StatusModeCyan   guifg=#1d2021 guibg=#689d6a gui=bold
	hi StatusModeBlue   guifg=#1d2021 guibg=#458588 gui=bold
	hi StatusModeYellow guifg=#1d2021 guibg=#d79921 gui=bold
	hi StatusModePink   guifg=#1d2021 guibg=#b16286 gui=bold
	hi StatusModeRed    guifg=#1d2021 guibg=#cc241d gui=bold
	hi StatusLight      guifg=#1d2021 guibg=#a89984
	hi StatusDark       guifg=#ebdbb2 guibg=#3c3836
	hi StatusDarker     guifg=#a89984 guibg=#282828
endfunction

function statusline#getmode()
	let l:m = mode()
	if l:m[0] ==# "n"
		return 'N'
	elseif l:m[0] ==# "i"
		return 'I'
	elseif l:m[0] =~# '\v(v|V||s|S|)'
		return 'V'
	elseif l:m[0] ==# "c"
		return 'C'
	elseif l:m[0] ==# "t"
		return 'T'
	else
		return l:m
	endif
endfunction

function statusline#updatemodecolor(mode)
	if a:mode ==# "N"
		hi link StatusMode StatusModeCyan
	elseif a:mode ==# "I"
		hi link StatusMode StatusModeBlue
	elseif a:mode ==# 'V'
		hi link StatusMode StatusModeYellow
	elseif a:mode ==# "C"
		hi link StatusMode StatusModePink
	else
		hi link StatusMode StatusModeRed
	endif

	return ''
endfunction

function statusline#getbranch()
	let branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if branch ==# ''
		return ''
	else
		return 'שׂ '.branch
	endif
endfunction
