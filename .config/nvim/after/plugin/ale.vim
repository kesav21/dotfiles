let g:ale_linters = {
	\ 'c': [ 'clangd' ],
	\ 'lua': [ 'luacheck' ],
	\ }

let g:ale_lua_luacheck_options = '--globals vim'
