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
set shortmess+=c
set signcolumn=yes

set background=dark
set termguicolors

set tabstop=4     " value of a \\t
set shiftwidth=4  " how many columns << and >> will add/remove
set softtabstop=4 " how many columns tab will add (in insert mode)
set noexpandtab   " expandtab: tab will generate spaces (in insert mode)

set updatetime=40

set list
set listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀

filetype plugin indent on
syntax on

" }}}

" mappings {{{

let mapleader = " "

inoremap jk <esc>
nnoremap Q <nop>
nnoremap Y y$
" tabs
nnoremap <silent> <tab>   :tabnext<cr>
nnoremap <silent> <s-tab> :tabprevious<cr>
" leader mappings
nnoremap          <leader>e        :tabnew <c-r>=expand('%:p:h') . '/'<cr>
nnoremap <silent> <leader>c        :set colorcolumn=<cr>
" function key mappings
nnoremap <F1> :make<cr>
nnoremap <F2> :!%:p<cr>

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

" local plugin
set rtp+=$HOME/projects/miniline.vim
set rtp+=$HOME/projects/vim-commentary-config
set rtp+=$HOME/projects/vim-hcl

call plug#begin($XDG_DATA_HOME.'/nvim/vim-plug')
	Plug 'gruvbox-community/gruvbox'  " gruvbox theme
	Plug 'tpope/vim-commentary'       " commenting
	Plug 'junegunn/fzf.vim'           " file search
	Plug 'jiangmiao/auto-pairs'       " bracket matching
	Plug 'tpope/vim-surround'         " helps surround things
	Plug 'wellle/targets.vim'         " more text objects
	Plug 'junegunn/vim-slash'         " better searching
	Plug 'tommcdo/vim-lion'           " code align
	Plug 'tpope/vim-repeat'           " better repeating for plugins
	Plug 'sbdchd/neoformat'           " code formatter
	Plug 'kovetskiy/sxhkd-vim'        " sxhkd highlighting
	Plug 'dkarter/bullets.vim', {
		\ 'for': 'markdown'
		\ }                           " markdown bulleting
	Plug 'Shougo/deoplete.nvim', {
		\ 'do': ':UpdateRemotePlugins'
		\ }                           " completion menu
	Plug 'leafgarland/typescript-vim' " typescript highlighting
	Plug 'airblade/vim-gitgutter'     " git integration
	Plug 'Yggdroot/indentLine'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'justinmk/vim-sneak'
	" Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
	" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
	Plug 'nvim-treesitter/nvim-treesitter'
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

let g:neoformat_enabled_python = [ 'black' ]

let g:neoformat_enabled_sh = [ 'shfmt' ]
let g:neoformat_sh_shfmt = {
	\ 'exe': 'shfmt',
	\ 'args': ['-p', '-i 0', '-ci'],
	\ }

let g:neoformat_enabled_typescript = [ 'prettier' ]

let g:deoplete#enable_at_startup = 1

let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

let g:indentLine_char = '›'

" }}}

