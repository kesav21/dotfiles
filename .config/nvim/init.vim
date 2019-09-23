" vim: set foldmethod=marker:


" plugins {{{

call plug#begin('~/.local/share/nvim/vim-plug')

"" plugins/misc {{{

	" adds airline status bar to vim
	Plug 'vim-airline/vim-airline'
	" faster commenting
	Plug 'tpope/vim-commentary'
	" git plugin (airline requires)
	Plug 'tpope/vim-fugitive'
	" helps surround things
	Plug 'tpope/vim-surround'
	" language pack for vim
	Plug 'sheerun/vim-polyglot'
	" display hex color codes
	Plug 'chrisbra/Colorizer'
	" python folding
	" Plug 'vim-scripts/python_fold'
	Plug 'kalekundert/vim-coiled-snake'
	" fzf for vim
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" code alignment
	Plug 'junegunn/vim-easy-align'
	" latex plugin
	Plug 'lervag/vimtex'
	Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	" snippets
	Plug 'sirver/ultisnips'

"" }}}

"" plugins/colorscheme {{{

	" gruvbox theme
	Plug 'morhetz/gruvbox'

"" }}}

call plug#end()

" }}}


" settings {{{

"" settings/misc {{{

	set number relativenumber
	" set cursorline
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

"" }}}

"" settings/tabs {{{

	set autoindent noexpandtab tabstop=4 shiftwidth=4

"" }}}

"" settings/syntax-highlighting {{{

	filetype plugin indent on
	syntax on

"" }}}

"" settings/listchars {{{

	set showbreak=↪
	set list listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀

"" }}}

"" settings/colors {{{

	set background=dark
	set termguicolors

"" }}}

"" settings/plugins {{{

""" settings/plugins/gruvbox {{{

	let g:gruvbox_italic = 1
	let g:gruvbox_contrast_dark = "medium"
	let g:gruvbox_invert_selection = 0

	colorscheme gruvbox

""" }}}

""" settings/plugins/netrw {{{

	let g:netrw_banner = 0
	let g:netrw_liststyle = 3

""" }}}

""" settings/plugins/airline {{{

	let g:airline_skip_empty_sections = 1
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1

""" }}}

""" settings/plugins/vimtex {{{

	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=2
	let g:tex_conceal='abdmg'

""" }}}

""" settings/plugins/ultisnips {{{

	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsListSnippets = '<c-tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

	let g:UltiSnipsSnippetsDir = '/home/kesav/.config/nvim/ultisnips'
	let g:UltiSnipsSnippetDirectories = ['ultisnips']

""" }}}

""" settings/plugins/vim-latex-live-preview {{{

	let g:livepreview_previewer = 'zathura'

""" }}}

"" }}}

" }}}


" autocommands {{{

"" autocommands/misc {{{

	augroup misc
		autocmd!

		" when shortcut files are updated, renew bash and vifm configs with new material
		autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !~/.local/bin/bm_genlite
		" when dunstrc is updated, restart dunst
		autocmd BufWritePost ~/.config/dunst/dunstrc !~/.local/bin/dunst_restart

		" disables automatic commenting on newline
		autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
		" automatically deletes all trailing whitespace on save
		autocmd BufWritePre * %s/\s\+$//e
	augroup END

"" }}}

"" autocommands/filetype {{{

""" autocommands/filetype/python {{{

	augroup filetype_python
		autocmd!
		" python files have tabs set to 4
		autocmd FileType python setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
	augroup END

""" }}}

""" }}}

"" autocommands/commenstrings {{{

	augroup commentstrings
		autocmd!
		autocmd FileType markdown set commentstring=<!--\ %s\ -->
		autocmd FileType xdefaults set commentstring=!\ %s
		autocmd FileType cpp set commentstring=//\ %s
	augroup END

"" }}}

" }}}


" mappings {{{

"" mappings/misc {{{

	" set leader key
	let mapleader = " "
	" clear all mappings
	mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>
	" add autoclose mappings
	" source ~/.config/nvim/config/autoclose.vim
	" the escape key is too far
	inoremap jk <esc>
	" clear search
	nnoremap <silent> <leader>, :nohlsearch<cr>

	" inoremap <expr> <leader>k ExitAutoClose()
	" inoremap <leader>k :<c-u>:call ExitAutoClose()<cr>

	" function! ExitAutoClose()
	" 	let chr = getline('.')[col('.')-1]

	" 	if chr == ')'
	" 		execute "normal! a"
	" 	else
	" 		execute "normal! a"
	" 	endif
	" endfunction

"" }}}

"" mappings/movement {{{

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
	nnoremap <space> <nop>

"" }}}

"" mappings/plugins {{{

	" plug mappings
	noremap <leader>pi :PlugInstall<cr>
	noremap <leader>pc :PlugClean<cr>
	" toggle netrw
	noremap <leader>n :Explore<cr>
	" toggle colorhighlight
	nnoremap <leader>ch :ColorToggle<cr>
	" run fzf.vim
	nnoremap <leader>f :Files<cr>
	" toggle tagbar
	nnoremap <leader>t :TagbarToggle<cr>
	" start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)
	" start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)
	" start interactive EasyAlign for a motion/text object (e.g. gaip)
	nnoremap <leader>ue :UltiSnipsEdit<cr>
	" launch live preview of latex file
	nnoremap <leader>lp :LLPStartPreview<cr>

"" }}}

"" mappings/buffers {{{

	" switch to previous buffer
	nnoremap <silent> <leader>j :bp<cr>
	" switch to next buffer
	nnoremap <silent> <leader>k :bn<cr>
	" delete buffer
	nnoremap <silent> <leader>x :bd<cr>

"" }}}

" }}}


" omappings {{{

"" omappings/misc {{{

	onoremap in( :<c-u>normal! f(vi(<cr>
	onoremap in{ :<c-u>normal! f{vi{<cr>
	onoremap in[ :<c-u>normal! f[vi[<cr>

	onoremap il( :<c-u>normal! F)vi(<cr>
	onoremap il{ :<c-u>normal! F)vi{<cr>
	onoremap il[ :<c-u>normal! F)vi[<cr>

"" }}}

" }}}


