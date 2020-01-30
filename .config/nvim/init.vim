" vim: set foldmethod=marker:


" replace with nvim_get_dir('data').'vim-plug'
call plug#begin('~/.local/share/nvim/vim-plug')

" plugins/misc {{{

	" commenting
	Plug 'tpope/vim-commentary'

	" file search
	Plug 'junegunn/fzf.vim'

	" snippets
	Plug 'sirver/ultisnips'
	" intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" bracket matching
	Plug 'jiangmiao/auto-pairs'
	" helps surround things
	Plug 'tpope/vim-surround'

	" text object based on indentation
	" Plug 'michaeljsmith/vim-indent-object'
	" text object for function arguments
	" Plug 'vim-scripts/argtextobj.vim'
	" text object for camelcase words
	" Plug 'bkad/CamelCaseMotion'
	" more text objects
	Plug 'wellle/targets.vim'

	" i'm not entirely sure what this does
	Plug 'ryanoasis/vim-devicons'
	" better searching
	Plug 'junegunn/vim-slash'
	" code align
	Plug 'tommcdo/vim-lion'
	" better repeating for plugins
	Plug 'tpope/vim-repeat'
	" better line searching
	" Plug 'unblevable/quick-scope'
	" listchars but for spaces
	Plug 'Yggdroot/indentLine'
	" faster folding
	Plug 'Konfekt/FastFold'

	" tag management
	Plug 'ludovicchabant/vim-gutentags'

	" code formatter
	Plug 'sbdchd/neoformat'

" }}}

" plugins/appearance {{{

	" gruvbox theme
	Plug 'gruvbox-community/gruvbox'

	" status bar
	Plug 'vim-airline/vim-airline'
	" statusbar git plugin
	Plug 'tpope/vim-fugitive'

" }}}

" plugins/language {{{

	" markdown bulleting
	Plug 'dkarter/bullets.vim'

	" latex
	Plug 'lervag/vimtex'
	Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

	" python folding
	Plug 'kalekundert/vim-coiled-snake'

	" plugins/language/syntax-highlighting

	" c++
	Plug 'octol/vim-cpp-enhanced-highlight'
	" haskell
	Plug 'neovimhaskell/haskell-vim'
	" python
	Plug 'vim-python/python-syntax'

	" syntax file for sxhkd
	Plug 'kovetskiy/sxhkd-vim'

" }}}


call plug#end()


" settings/misc {{{

	set number relativenumber
	set cursorline
	set colorcolumn=88
	set modeline
	set wildmode=longest,list,full
	set laststatus=0
	set noshowmode
	set noruler
	set noshowcmd
	set hlsearch
	set is
	set timeout timeoutlen=1000
	set clipboard+=unnamedplus

	" increases startup time by 10ms
	set guioptions=M

	" tabs

	" value of \t
	set tabstop=4
	" how many columns << and >> will add/remove
	set shiftwidth=4
	" how many columns tab will add (in insert mode)
	set softtabstop=4
	" expandtab: tab will generate spaces (in insert mode)
	set noexpandtab

	" syntax-highlighting

	filetype plugin indent on
	syntax on

	" listchars

	set showbreak=↪
	set list
	set listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀

	" colors

	set background=dark
	set termguicolors

" }}}

" settings/plugins {{{

	" gruvbox

	let g:gruvbox_italic = 1
	let g:gruvbox_invert_selection = 0

	" dark theme
	let g:gruvbox_contrast_dark = "medium"
	" light theme
	let g:gruvbox_contrast_light = "soft"

	colorscheme gruvbox

	" airline

	let g:airline_skip_empty_sections = 1
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1

	let g:airline_section_z = ''

	" vimtex

	let g:tex_flavor='latex'
	" let g:tex_flavor='lualatex'

	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=2
	" set conceallevel=0
	let g:tex_conceal='abdmg'

	" ultisnips

	let g:UltiSnipsSnippetsDir = '/home/kesav/.config/nvim/ultisnips'
	let g:UltiSnipsSnippetDirectories = ['ultisnips']

	let g:UltiSnipsExpandTrigger = '<c-l>'
	let g:UltiSnipsJumpForwardTrigger = '<c-j>'
	let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

	" vim-latex-live-preview

	let g:livepreview_previewer = 'zathura'

	" fzf

	" command to generate tags file
	let g:fzf_tags_command = 'ctags -R'

	" indentLine

	" let g:indentLine_char = '|'
	let g:indentLine_char = '›'
	" let g:indentLine_char = '▏'

	" python

	let g:python_highlight_all = 1

	" vim_polyglot

	let g:cpp_class_scope_highlight = 1
	let g:cpp_member_variable_highlight = 1
	let g:cpp_class_decl_highlight = 1
	let g:cpp_experimental_simple_template_highlight = 1
	let g:cpp_experimental_template_highlight = 1
	let g:cpp_concepts_highlight = 1

	" coc.nvim

	" if hidden is not set, TextEdit might fail.
	set hidden
	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup
	" Better display for messages
	set cmdheight=2
	" You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300
	" don't give |ins-completion-menu| messages.
	set shortmess+=c
	" always show signcolumns
	set signcolumn=yes

	" auto-pairs

	let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", }

	" camelcase

	let g:camelcasemotion_key = '<leader>'

	" neoformat

	let g:neoformat_enabled_python = [ 'black' ]

	let g:neoformat_enabled_c = [ 'astyle' ]
	let g:neoformat_c_astyle = {
		\ 'exe': 'astyle',
		\ 'args': ['-T4', '-A2'],
		\ 'stdin': 1,
	  \ }

	" let g:neoformat_enabled_cpp = []
	let g:neoformat_enabled_cpp = [ 'astyle' ]
	let g:neoformat_cpp_astyle = {
		\ 'exe': 'astyle',
		\ 'args': ['-T4', '-A2'],
		\ 'stdin': 1,
	  \ }

	let g:neoformat_enabled_haskell = [ 'stylish_haskell' ]
	let g:neoformat_haskell_stylish_haskell = {
		\ 'exe': 'stylish-haskell',
	\ }

	let g:neoformat_enabled_sh = [ 'shfmt' ]
	let g:neoformat_sh_shfmt = {
		\ 'exe': 'shfmt',
		\ 'args': ['-p', '-i 0', '-bn', '-ci', '-sr'],
	\ }

" }}}


" autocommands {{{

	" autocommands/misc

	augroup misc
		autocmd!

		" when bookmark files are updated, re-run bookmark generator
		autocmd BufWritePost *bm_dirs,*bm_files !bmgen
		" when dunstrc is updated, restart dunst
		" figure out how to restart a process
		autocmd BufWritePost *dunstrc !killall -q dunst; dunst &

		autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

		" disables automatic commenting on newline
		autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
		" automatically deletes all trailing whitespace on save
		autocmd BufWritePre * %s/\s\+$//e
	augroup END

	augroup disablemappings
		autocmd!
		autocmd VimEnter * :xnoremap gc <Nop>
		autocmd VimEnter * :nnoremap gcgc <Nop>
		autocmd VimEnter * :onoremap gc <Nop>
		autocmd VimEnter * :nnoremap gcc <Nop>
	augroup END

	" autocommands/filetype

	" autocommands/filetype/tabs

	augroup au_tabs
		autocmd!

		autocmd FileType python,haskell setlocal expandtab
	augroup END

	" autocommands/filetype/commenstrings

	augroup commentstrings
		autocmd!
		autocmd FileType markdown set commentstring=<!--\ %s\ -->
		autocmd FileType xdefaults set commentstring=!\ %s
		autocmd FileType c,cpp set commentstring=//\ %s
		autocmd FileType matlab set commentstring=%\ %s
		autocmd FileType crontab set commentstring=#\ %s
	augroup END

	" autocommands/filetype/colorcolumn

	augroup filetype_colorcolumn
		autocmd!

		autocmd FileType python setlocal colorcolumn=88
		autocmd FileType gitcommit setlocal colorcolumn=50
	augroup END

	" autocommands/filetype/formatting

	set shortmess=filnxtToOc
	augroup filetype_neoformat
		autocmd!
		autocmd BufWritePre * if &filetype == 'sh' | Neoformat
		autocmd BufWritePre * if &filetype == 'c' | Neoformat
		autocmd BufWritePre * if &filetype == 'cpp' | Neoformat
	augroup END

	" autocommands/plugins/coc.nvim

	" highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

" }}}


" mappings {{{

	" set leader key
	let mapleader = " "
	" clear all mappings
	mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>
	" the escape key is too far
	inoremap jk <esc>
	" clear search
	nnoremap <silent> <leader>, :nohlsearch<cr>
	" buffers
	nnoremap <silent> <leader>j :bp<cr>
	nnoremap <silent> <leader>k :bn<cr>
	nnoremap <silent> <leader>x :bd<cr>

" }}}

" mappings/movement {{{

	" disable arrow keys, in normal mode
	nnoremap <up> <nop>
	nnoremap <down> <nop>
	nnoremap <left> <nop>
	nnoremap <right> <nop>

	" disable arrow keys, in insert mode
	inoremap <up> <nop>
	inoremap <down> <nop>
	inoremap <left> <nop>
	inoremap <right> <nop>

	" disable arrow keys, in visual mode
	vnoremap <up> <nop>
	vnoremap <down> <nop>
	vnoremap <left> <nop>
	vnoremap <right> <nop>

	" disable some keys, in normal mode
	nnoremap <bs> <nop>
	nnoremap <del> <nop>
	" nnoremap <space> <nop>

" }}}

" mappings/plugins {{{

	" mappings/plugins/misc

	" commenting
	nnoremap <silent> <c-_> :Commentary<cr>
	vnoremap <silent> <c-_> :Commentary<cr>
	inoremap <silent> <c-_> <c-o>:Commentary<cr>
	" plug mappings
	noremap <leader>pi :PlugInstall<cr>
	noremap <leader>pc :PlugClean<cr>
	" run fzf.vim
	nnoremap <silent> <leader>f :Files<cr>
	nnoremap <silent> <leader>t :Tags<cr>
	" edit common snippets file
	nnoremap <leader>ua :UltiSnipsEdit all<cr>
	" edit language-specific snippets file
	nnoremap <leader>ue :UltiSnipsEdit<cr>
	" launch live preview of latex file
	nnoremap <leader>lp :LLPStartPreview<cr>

	" mappings/plugins/coc.nvim

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1] =~# '\s'
	endfunction

	" navigate tab completion
	inoremap <silent><expr> <tab>
		\ pumvisible() ? "\<c-n>" :
		\ <sid>check_back_space() ? "\<tab>" :
		\ coc#refresh()
	" navigate backwards
	inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
	" confirm completion
	inoremap <silent><expr> <cr>
		\ pumvisible() ? coc#_select_confirm() :
		\ "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

	" trigger completion
	inoremap <silent><expr> <c-space> coc#refresh()

	" go to definition
	nmap <silent> gd <Plug>(coc-definition)

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" show documentation
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	" refactor current word
	nmap <leader>rn <Plug>(coc-rename)

" }}}


