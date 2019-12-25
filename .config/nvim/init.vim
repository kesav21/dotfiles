" vim: set foldmethod=marker:


" plugins {{{

call plug#begin('~/.local/share/nvim/vim-plug')

" plugins/misc {{{

	" status bar
	Plug 'vim-airline/vim-airline'
	" statusbar git plugin
	Plug 'tpope/vim-fugitive'
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
	Plug 'michaeljsmith/vim-indent-object'
	" text object for function arguments
	Plug 'vim-scripts/argtextobj.vim'
	" text object for camelcase words
	Plug 'bkad/CamelCaseMotion'

	" listchars but for spaces
	" Plug 'Yggdroot/indentLine'
	" display hex color codes
	" Plug 'chrisbra/Colorizer'
	" code alignment
	" Plug 'junegunn/vim-easy-align'

" }}}

" plugins/colorscheme {{{

	" gruvbox theme
	Plug 'gruvbox-community/gruvbox'

" }}}

" plugins/language {{{

" plugins/language/misc {{{

	" markdown bulleting
	Plug 'dkarter/bullets.vim'

	" latex
	Plug 'lervag/vimtex'
	Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

	" python code formatter
	Plug 'dimbleby/black.vim'
	" python folding
	Plug 'kalekundert/vim-coiled-snake'

	" cpp code formatter
	Plug 'rhysd/vim-clang-format'
	" haskell code formatter
	Plug 'nbouscal/vim-stylish-haskell'

" }}}

" plugins/language/syntax-highlighting {{{

	" language pack
	" Plug 'sheerun/vim-polyglot'

	" c++
	Plug 'octol/vim-cpp-enhanced-highlight'
	" haskell
	Plug 'neovimhaskell/haskell-vim'
	" python
	Plug 'vim-python/python-syntax'

" }}}

" }}}

call plug#end()

" }}}

" settings {{{

" settings/misc {{{

	set number relativenumber
	set cursorline
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

" }}}

" settings/tabs {{{

	" value of \t
	set tabstop=4
	" how many columns << and >> will add/remove
	set shiftwidth=4
	" how many columns tab will add (in insert mode)
	set softtabstop=4
	" expandtab: tab will generate spaces (in insert mode)
	set noexpandtab

" }}}

" settings/syntax-highlighting {{{

	filetype plugin indent on
	syntax on

" }}}

" settings/listchars {{{

	set showbreak=↪
	set list
	set listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀

" }}}

" settings/colors {{{

	set background=dark
	set termguicolors

" }}}

" settings/plugins {{{

" settings/plugins/gruvbox {{{

	let g:gruvbox_italic = 1
	let g:gruvbox_invert_selection = 0

	" dark theme
	let g:gruvbox_contrast_dark = "medium"
	" light theme
	let g:gruvbox_contrast_light = "soft"

	colorscheme gruvbox

" }}}

" settings/plugins/airline {{{

	let g:airline_skip_empty_sections = 1
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1

" }}}

" settings/plugins/vimtex {{{

	let g:tex_flavor='latex'
	" let g:tex_flavor='lualatex'

	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=2
	let g:tex_conceal='abdmg'

" }}}

" settings/plugins/ultisnips {{{

	let g:UltiSnipsSnippetsDir = '/home/kesav/.config/nvim/ultisnips'
	let g:UltiSnipsSnippetDirectories = ['ultisnips']

	let g:UltiSnipsExpandTrigger = '<c-l>'
	let g:UltiSnipsJumpForwardTrigger = '<c-j>'
	let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" }}}

" settings/plugins/vim-latex-live-preview {{{

	let g:livepreview_previewer = 'zathura'

" }}}

" settings/plugins/fzf {{{

	" command to generate tags file
	let g:fzf_tags_command = 'ctags -R'

" }}}

" settings/plugins/indentLine {{{

	" let g:indentLine_char = '|'
	let g:indentLine_char = '›'
	" let g:indentLine_char = '▏'

" }}}

" settings/plugins/python {{{

	let g:python_highlight_all = 1

" }}}

" settings/plugins/vim_polyglot {{{

	let g:cpp_class_scope_highlight = 1
	let g:cpp_member_variable_highlight = 1
	let g:cpp_class_decl_highlight = 1
	let g:cpp_experimental_simple_template_highlight = 1
	let g:cpp_experimental_template_highlight = 1
	let g:cpp_concepts_highlight = 1

" }}}

" settings/plugins/coc.nvim {{{

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

" }}}

" settings/plugins/auto-pairs {{{

	let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" }}}

" }}}

" }}}

" autocommands {{{

" autocommands/misc {{{

	augroup misc
		autocmd!
		" when bookmark files are updated, re-run bookmark generator
		autocmd BufWritePost ~/.local/scripts/bookmarks/bm_dirs,~/.local/scripts/bookmarks/bm_files !~/.local/bin/bm_gen
		" when dunstrc is updated, restart dunst
		autocmd BufWritePost ~/.config/dunst/dunstrc !~/.local/bin/dunst_restart

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

" }}}

" autocommands/filetype {{{

" autocommands/filetype/tabs {{{

	augroup au_tabs
		autocmd!

		autocmd FileType python,haskell setlocal expandtab
	augroup END

" }}}

" autocommands/filetype/commenstrings {{{

	augroup commentstrings
		autocmd!
		autocmd FileType markdown set commentstring=<!--\ %s\ -->
		autocmd FileType xdefaults set commentstring=!\ %s
		autocmd FileType cpp set commentstring=//\ %s
		autocmd FileType matlab set commentstring=%\ %s
	augroup END

" }}}

" autocommands/filetype/colorcolumn {{{

	augroup filetype_colorcolumn
		autocmd!

		autocmd FileType python setlocal colorcolumn=88
		autocmd FileType gitcommit setlocal colorcolumn=50
	augroup END

" }}}

" }}}

" autocommands/plugins/coc.nvim {{{

	" highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

" }}}

" }}}

" mappings {{{

" mappings/misc {{{

	" set leader key
	let mapleader = " "
	" clear all mappings
	mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>
	" the escape key is too far
	inoremap jk <esc>
	" clear search
	nnoremap <silent> <leader>, :nohlsearch<cr>

	" switch background colors
	function! ToggleBackground()
		if &background == 'dark'
			set background=light
		else
			set background=dark
		endif
	endfunction
	nnoremap <silent> <leader>b :call ToggleBackground()<cr>

	" comment/uncomment
	nnoremap <silent> <c-_> :Commentary<cr>
	vnoremap <silent> <c-_> :Commentary<cr>
	inoremap <silent> <c-_> <c-o>:Commentary<cr>

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

" mappings/buffers {{{

	" switch to previous buffer
	nnoremap <silent> <leader>j :bp<cr>
	" switch to next buffer
	nnoremap <silent> <leader>k :bn<cr>
	" delete buffer
	nnoremap <silent> <leader>x :bd<cr>

" }}}

" mappings/plugins {{{

" mappings/plugins/misc {{{

	" plug mappings
	noremap <leader>pi :PlugInstall<cr>
	noremap <leader>pc :PlugClean<cr>
	" run fzf.vim
	nnoremap <leader>f :Files<cr>
	nnoremap <leader>t :BTags<cr>
	" edit common snippets file
	nnoremap <leader>ua :UltiSnipsEdit all<cr>
	" edit language-specific snippets file
	nnoremap <leader>ue :UltiSnipsEdit<cr>
	" launch live preview of latex file
	nnoremap <leader>lp :LLPStartPreview<cr>

" }}}

" mappings/plugins/coc.nvim {{{

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
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

" }}}

" }}}

" omappings {{{

" omappings/misc {{{

	onoremap in( :<c-u>normal! f(vi(<cr>
	onoremap in{ :<c-u>normal! f{vi{<cr>
	onoremap in[ :<c-u>normal! f[vi[<cr>
	onoremap in" :<c-u>normal! f"vi"<cr>
	onoremap in' :<c-u>normal! f'vi'<cr>

	" onoremap il( :<c-u>normal! F)vi(<cr>
	" onoremap il{ :<c-u>normal! F)vi{<cr>
	" onoremap il[ :<c-u>normal! F)vi[<cr>
	" onoremap il" :<c-u>normal! f"vi"<cr>
	" onoremap in' :<c-u>normal! f'vi'<cr>

" }}}

" }}}

