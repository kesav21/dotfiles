" vim: set foldmethod=marker:

" settings {{{

set number relativenumber
set cursorline
set colorcolumn=88
set modeline
set wildmode=longest,list,full
set hlsearch incsearch
set timeout timeoutlen=1000
set clipboard+=unnamedplus
set guioptions=M

set background=dark
set termguicolors

set tabstop=4     " value of a \\t
set shiftwidth=4  " how many columns << and >> will add/remove
set softtabstop=4 " how many columns tab will add (in insert mode)
set noexpandtab   " expandtab: tab will generate spaces (in insert mode)

set updatetime=40

set showbreak=↪
set list
set listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀

set laststatus=2
set statusline=
set statusline+=%#PmenuSel# " set color
set statusline+=\ %F        " full file name
set statusline+=\ %M        " unsaved changes?
set statusline+=\ %r        " readonly?
set statusline+=\ %y        " file type
set statusline+=%=
set statusline+=\ %l:%c\    " line:column

filetype plugin indent on
syntax on

" }}}

" mappings {{{

let mapleader = " "

inoremap jk <esc>
nnoremap S :%s//g<left><left>
nnoremap Q <nop>
nnoremap <c-a> :source $XDG_CONFIG_HOME/nvim/init.vim<cr>
" tabs
nnoremap <silent> <tab> :tabnext<cr>
nnoremap <silent> <s-tab> :tabprevious<cr>
" move lines in visual mode
xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv

" }}}

" autocommands {{{

augroup misc
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd BufWritePost *bm_dirs,*bm_files !bmgen
	autocmd BufWritePost *dunstrc !killall -q dunst; dunst &
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END

" }}}

" plugins {{{

call plug#begin($XDG_DATA_HOME.'/nvim/vim-plug')
	Plug 'gruvbox-community/gruvbox'  " gruvbox theme
	Plug 'tpope/vim-commentary'       " commenting
	Plug 'junegunn/fzf.vim'           " file search
	Plug 'jiangmiao/auto-pairs'       " bracket matching
	Plug 'tpope/vim-surround'         " helps surround things
	Plug 'wellle/targets.vim'         " more text objects
	Plug 'ryanoasis/vim-devicons'     " icons
	Plug 'junegunn/vim-slash'         " better searching
	Plug 'tommcdo/vim-lion'           " code align
	Plug 'tpope/vim-repeat'           " better repeating for plugins
	Plug 'sbdchd/neoformat'           " code formatter
	Plug 'kovetskiy/sxhkd-vim'        " sxhkd highlighting
	Plug 'dkarter/bullets.vim'        " markdown bulleting
	Plug 'neovim/nvim-lsp'            " built-in lsp
	Plug 'Shougo/deoplete.nvim', {
		\ 'do': ':UpdateRemotePlugins'
		\ }                           " completion menu
	Plug 'Shougo/deoplete-lsp'        " lsp completion
	Plug 'leafgarland/typescript-vim' " typescript highlighting
	Plug 'airblade/vim-gitgutter'     " git integration
call plug#end()

" Plug 'hashivim/vim-terraform' " terraform language server

" }}}

" plugin settings {{{

let b:lion_squeeze_spaces = 1

let g:fzf_tags_command = ''
let g:fzf_preview_window = ''

let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = 'hard' " dark theme
let g:gruvbox_contrast_light = 'hard' " light theme
colorscheme gruvbox

let g:neoformat_enabled_sh = [ 'shfmt' ]
let g:neoformat_sh_shfmt = {
	\ 'exe': 'shfmt',
	\ 'args': ['-p', '-i 0', '-ci'],
\ }

let g:neoformat_enabled_typescript = [ 'prettier' ]

let g:deoplete#enable_at_startup = 1

let g:gitgutter_enabled = 1

" }}}

