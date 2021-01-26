
let g:neoformat_enabled_python = [ 'black' ]

let g:neoformat_enabled_sh = [ 'shfmt' ]
let g:neoformat_sh_shfmt = {
	\ 'exe': 'shfmt',
	\ 'args': ['-p', '-i 0', '-ci'],
	\ }

let g:neoformat_enabled_haskell = [ 'brittany' ]

let g:neoformat_enabled_typescript = [ 'prettier' ]
let g:neoformat_enabled_javascript = [ 'prettier' ]

let g:neoformat_enabled_go = [ 'gofmt' ]
let g:neoformat_go_gofmt = {
	\ 'exe': 'gofmt',
	\ 'args': ['-s'],
	\ }

let g:neoformat_enabled_java = ['astyle']
let g:neoformat_java_astyle = {
	\ 'exe': 'astyle',
	\ 'args': ['--indent=tab', '<'],
	\ }

" let g:neoformat_enabled_c = ['astyle']
" let g:neoformat_c_astyle = {
" 	\ 'exe': 'astyle',
" 	\ 'args': [
" 		\ '--style=attach',
" 		\ '--indent=force-tab',
" 		\ '--attach-namespaces',
" 		\ '--attach-classes',
" 		\ '--attach-inlines',
" 		\ '--attach-extern-c',
" 		\ '--attach-closing-while',
" 		\ '--indent-classes',
" 		\ '--indent-switches',
" 		\ '--indent-namespaces',
" 		\ '--pad-oper',
" 		\ '--pad-comma',
" 		\ '--pad-header',
" 		\ '--unpad-paren',
" 		\ '--align-pointer=type',
" 		\ '--break-one-line-headers',
" 		\ '--add-braces',
" 		\ '--max-code-length=80',
" 		\ '<'],
" 	\ }

let g:neoformat_enabled_c = []
let g:neoformat_enabled_cpp = []
let g:neoformat_enabled_markdown = []

