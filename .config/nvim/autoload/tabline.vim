
function tabline#createcolors()
	hi TabHeader guifg=#1d2021 guibg=#689d6a gui=bold
	hi TabSel    guifg=#1d2021 guibg=#a89984
	hi TabUnsel  guifg=#a89984 guibg=#282828
	hi TabClear  guibg=#282828
endfunction

function tabline#gettabline()
	let s = ''
	let s .= '%#TabHeader#'
	let s .= ' TABS ' " align with signcolumn
	for i in range(tabpagenr('$'))
		if i + 1 == tabpagenr()
			let s .= '%#TabSel#'
		else
			let s .= '%#TabUnsel#'
		endif
		let buflist = tabpagebuflist(i + 1)
		let winnr = tabpagewinnr(i + 1) - 1
		let name = bufname(buflist[winnr])
		let s .= ' '.name.' '
	endfor
	let s .= '%#TabClear#'
	return s
endfunction

