" vim: set foldmethod=marker:


" plugins {{{

call plug#begin($XDG_DATA_HOME.'/nvim/vim-plug')

" misc

Plug 'tpope/vim-commentary'         " commenting
Plug 'junegunn/fzf.vim'             " file search
Plug 'jiangmiao/auto-pairs'         " bracket matching
Plug 'tpope/vim-surround'           " helps surround things
Plug 'wellle/targets.vim'           " more text objects
Plug 'ryanoasis/vim-devicons'       " icons
Plug 'junegunn/vim-slash'           " better searching
Plug 'tommcdo/vim-lion'             " code align
Plug 'tpope/vim-repeat'             " better repeating for plugins
Plug 'Yggdroot/indentLine'          " listchars but for spaces
Plug 'Konfekt/FastFold'             " faster folding
Plug 'ludovicchabant/vim-gutentags' " tag management
Plug 'sbdchd/neoformat'             " code formatter

" autocomplete

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion
Plug 'deathlyfrantic/deoplete-spell'                          " dictionary i think
Plug 'sirver/ultisnips'                                       " snippets

" appearance

Plug 'gruvbox-community/gruvbox' " gruvbox theme
Plug 'vim-airline/vim-airline'   " status bar
Plug 'tpope/vim-fugitive'        " statusbar git plugin

" language-specific

Plug 'dkarter/bullets.vim'                             " markdown bulleting
Plug 'lervag/vimtex'                                   " latex
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}   " latex conceal
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " latex preview
Plug 'kalekundert/vim-coiled-snake'                    " python folding

" syntax-highlighting

Plug 'vim-jp/vim-cpp'                   " c++
Plug 'octol/vim-cpp-enhanced-highlight' " c++
Plug 'neovimhaskell/haskell-vim'        " haskell
Plug 'vim-python/python-syntax'         " python
Plug 'kovetskiy/sxhkd-vim'              " syntax file for sxhkd

call plug#end()

" }}}


" settings {{{

" misc

set number relativenumber
set cursorline
set colorcolumn=88
set modeline
set wildmode=longest,list,full
set laststatus=0
set noshowmode
set noruler
set noshowcmd
set hlsearch incsearch
set timeout timeoutlen=1000
set clipboard+=unnamedplus
set shortmess+=c

set guioptions=M " increases startup time by 10ms

" tabs

set tabstop=4     " value of a \\t
set shiftwidth=4  " how many columns << and >> will add/remove
set softtabstop=4 " how many columns tab will add (in insert mode)
set noexpandtab   " expandtab: tab will generate spaces (in insert mode)

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

" gruvbox

let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = 'medium' " dark theme
let g:gruvbox_contrast_light = 'hard' " light theme
colorscheme gruvbox

" airline

let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vimtex

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

" vim-latex-live-preview

let g:livepreview_previewer = 'zathura'

" fzf

let g:fzf_tags_command = 'ctags -R' " generates tags

" indentLine

let g:indentLine_char = '›'

" python

let g:python_highlight_all = 1

" vim_polyglot

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

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

augroup misc
	autocmd!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup refresh
	autocmd!
	autocmd BufWritePost *bm_dirs,*bm_files !bmgen
	autocmd BufWritePost *dunstrc !killall -q dunst; dunst &
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END

augroup disablemappings
	autocmd!
	autocmd VimEnter * :xnoremap gc <Nop>
	autocmd VimEnter * :nnoremap gcgc <Nop>
	autocmd VimEnter * :onoremap gc <Nop>
	autocmd VimEnter * :nnoremap gcc <Nop>
augroup END

augroup fmt
	autocmd!
	autocmd BufWritePre * Neoformat
augroup END

augroup ft_tabs
	autocmd!
	autocmd FileType python,haskell,java setlocal expandtab
augroup END

augroup ft_commentstrings
	autocmd!
	autocmd FileType markdown set commentstring=<!--\ %s\ -->
	autocmd FileType xdefaults set commentstring=!\ %s
	autocmd FileType c,cpp set commentstring=//\ %s
	autocmd FileType matlab set commentstring=%\ %s
	autocmd FileType crontab set commentstring=#\ %s
augroup END

augroup ft_colorcolumn
	autocmd!
	autocmd FileType python setlocal colorcolumn=88
	autocmd FileType gitcommit setlocal colorcolumn=50
augroup END

" }}}


" mappings {{{

let mapleader = " "
mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>

inoremap jk <esc>
nnoremap S :%s//g<Left><Left>

" buffers
nnoremap <silent> <c-j> :bp<cr>
nnoremap <silent> <c-k> :bn<cr>
nnoremap <silent> <c-x> :bd<cr>
" commenting
nnoremap <silent> <c-_> :Commentary<cr>
vnoremap <silent> <c-_> :Commentary<cr>
inoremap <silent> <c-_> <c-o>:Commentary<cr>
" plug mappings
noremap <silent> <leader>pi :PlugInstall<cr>
noremap <silent> <leader>pc :PlugClean<cr>
" fzf.vim
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :BTags<cr>
nnoremap <silent> <leader>t :Tags<cr>
" launch live preview of latex file
nnoremap <silent> <leader>lp :LLPStartPreview<cr>

" }}}


" autocomplete {{{

" dictionary

" TODO: turn this on/off through a function
augroup spell
	autocmd!
	autocmd Filetype markdown set dictionary+=/usr/share/dict/words
	autocmd Filetype markdown set complete+=k
	autocmd Filetype markdown set spell
augroup END

" ultisnips

let g:UltiSnipsSnippetsDir = $XDG_CONFIG_HOME.'ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" deoplete

let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"

" }}}

