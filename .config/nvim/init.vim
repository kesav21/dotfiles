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

function CreateColors()
	hi StatusModeGray   guifg=#1d2021 guibg=#a89984 gui=bold
	hi StatusModeBlue   guifg=#1d2021 guibg=#458588 gui=bold
	hi StatusModeYellow guifg=#1d2021 guibg=#d79921 gui=bold
	hi StatusModePink   guifg=#1d2021 guibg=#b16286 gui=bold
	hi StatusModeRed    guifg=#1d2021 guibg=#cc241d gui=bold
	hi StatusLight      guifg=#1d2021 guibg=#a89984
	hi StatusDark       guifg=#ebdbb2 guibg=#3c3836
	hi StatusDarker     guifg=#a89984 guibg=#282828

	return ''
endfunction

function GetMode()
	let l:m = mode()
	if l:m[0] ==# "n"
		return 'N'
	elseif l:m[0] ==# "i"
		return 'I'
	elseif l:m[0] =~# '\v(v|V||s|S|)'
		return 'V'
	elseif l:m[0] ==# "c"
		return 'C'
	else
		return l:m
	endif
endfunction

function UpdateModeColor(mode)
	if a:mode ==# "N"
		hi link StatusMode StatusModeGray
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

function GetBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" only get branch once to improve performance
let g:branch = GetBranch()

set noshowmode
set laststatus=2

set statusline=
set statusline+=%{CreateColors()}             " not doing this clears the hi-groups
set statusline+=%{UpdateModeColor(GetMode())} " do this everytime the status is updated
set statusline+=%#StatusMode#
set statusline+=\ %{GetMode()}
set statusline+=\ %#StatusDark#
set statusline+=\ שׂ\ %{g:branch}
set statusline+=\ %#StatusDarker#
set statusline+=\ %f                          " file path
set statusline+=\ %=
set statusline+=\ %m                          " unsaved changes
set statusline+=\ %r                          " readonly
set statusline+=\ %#StatusDark#
set statusline+=\ %y                          " file type
set statusline+=\ %#StatusLight#
set statusline+=\ %cc                         " column
set statusline+=\ %l/%LL                      " line
set statusline+=\                             " padding

filetype plugin indent on
syntax on

" }}}

" mappings {{{

let mapleader = " "

inoremap jk <esc>
nnoremap S :%s//g<left><left>
nnoremap Q <nop>
" tabs
nnoremap <silent> <tab> :tabnext<cr>
nnoremap <silent> <s-tab> :tabprevious<cr>
" move lines in visual mode
xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv
" leader mappings
nnoremap <silent> <leader><leader> :write<cr>
nnoremap <silent> <leader>w        :quit<cr>
nnoremap <silent> <leader>q        :quit!<cr>
nnoremap <silent> <leader>r        :source $XDG_CONFIG_HOME/nvim/init.vim<cr>
nnoremap          <leader>e        :edit <c-r>=expand('%:p:h') . '/'<cr>

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

