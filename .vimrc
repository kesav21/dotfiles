
" readme {{{

	"
	" categories versus descriptions
	" if the comment is not tabbed over, then it is a category
	" if the comment if tabbed over, then it is a description
	"
	" categories:
	" heading 1: "
	" heading 2: ""
	" heading 3: """
	"
	" descriptions: 0\t"
	"

" }}}


" plugins {{{

call plug#begin()

"" plugins/misc {{{

	" syntax highlighting for i3 config
	Plug 'PotatoesMaster/i3-vim-syntax'
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

"" }}}

"" plugins/colorscheme {{{

	" gruvbox theme
	Plug 'morhetz/gruvbox'

"" }}}

"" plugins/school {{{

	" mips syntax highlighting
	Plug 'harenome/vim-mipssyntax'

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
	set hls is
	set timeout timeoutlen=1000

"" }}}

"" settings/tabs {{{

	set autoindent noexpandtab tabstop=4 shiftwidth=4

"" }}}

"" settings/syntax-highlighting {{{

	filetype indent plugin on
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

"" }}}

" }}}


" autocommands {{{

"" autocommands/misc {{{

	augroup misc
		autocmd!
		" when shortcut files are updated, renew bash and vifm configs with new material
		autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !~/.bin/bm_gen
		" disables automatic commenting on newline
		autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
		" automatically deletes all trailing whitespace on save
		autocmd BufWritePre * %s/\s\+$//e
		" enable spellcheck for markdown files
		autocmd BufRead,BufNewFile *.md setlocal spell
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

""" autocommands/filetype/vim {{{

	augroup filetype_vim
		autocmd!
		" for vim files, enable fold
		autocmd FileType vim setlocal foldmethod=marker
	augroup END

""" }}}

"" }}}

"" autocommands/commenstrings {{{

	augroup commentstrings
		autocmd!
		autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
		autocmd FileType xdefaults set commentstring=!\ %s
		autocmd FileType cpp set commentstring=//\ %s
	augroup END

"" }}}

" }}}


" mappings {{{

"" mappings/settings {{{

	" set leader key
	let mapleader = " "

"" }}}

"" mappings/misc {{{

	" the escape key is too far
	inoremap jk <esc>

	" insert blank line below
	" nnoremap <silent><C-j> :set paste<cr>m`o<esc>``:set nopaste<cr>
	" insert blank line above
	" nnoremap <silent><C-k> :set paste<cr>m`O<esc>``:set nopaste<cr>

	" move line up
	nnoremap <c-j> :m .+1<cr>==
	" move line down
	nnoremap <c-k> :m .-2<cr>==

"" }}}

"" mappings/plugins {{{

	" toggle nerdtree
	noremap <leader>n :Explore<cr>

	" toggle colorhighlight
	nnoremap <leader>ch :ColorToggle<cr>

"" }}}

"" mappings/buffers {{{

	" switch to next buffer
	nnoremap <c-l> :bn<cr>
	" switch to previous buffer
	nnoremap <c-h> :bp<cr>
	" delete buffer
	nnoremap <leader>bd :bd<cr>

"" }}}

"" mappings/habit-breaking {{{

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

"" mappings/leader {{{

	" in normal mode, insert a single character before/after
	nnoremap <leader>i i_<esc>r
	nnoremap <leader>I I_<esc>r
	nnoremap <leader>a a_<esc>r
	nnoremap <leader>A A_<esc>r

	" in normal mode, clear line
	nnoremap <leader>d 0d$

	" in normal mode, toggle spellcheck
	nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>

"" }}}

"" mappings/markdown {{{

	" italicize text
	nnoremap <leader>e A_<esc>I_<esc>
	" bold text
	nnoremap <leader>b A__<esc>I__<esc>
	" make line a list item
	nnoremap <leader>l I- <esc>j
	" add period to end of line
	nnoremap <leader>p A.<esc>j

	" make line a heading
	nnoremap <leader>h 0i# <esc>

"" }}}

" }}}


" omappings {{{

"" omappings/misc {{{

	onoremap in( :<c-u>normal! f(vi(<cr>
	onoremap il( :<c-u>normal! F)vi(<cr>

"" }}}

" }}}

