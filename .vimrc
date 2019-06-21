
" Plugins

call plug#begin()

" syntax highlighting for i3 config
Plug 'PotatoesMaster/i3-vim-syntax'
" adds a directory tree
Plug 'scrooloose/nerdtree'
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
" make gvim colorschemes work in terminal vim
" Plug 'godlygeek/csapprox'

" mips syntax highlighting
Plug 'harenome/vim-mipssyntax'


"" colorscheme

" nord theme
Plug 'arcticicestudio/nord-vim'

" one dark colorscheme
" this one is pretty good
Plug 'joshdick/onedark.vim'

" challenger theme
" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" adds delays to certain keys
" Plug 'takac/vim-hardtime'
" adds MIPS support
" Plug 'vim-scripts/mips.vim'
" adds virtualenv support
" Plug 'plytophogy/vim-virtualenv'
" adds git support to nerdtree
" Plug 'Xuyuanp/nerdtree-git-plugin'
" adds git support to the gutter
" Plug 'airblade/vim-gitgutter'
" adds editorconfig support for vim
" Plug 'editorconfig/editorconfig-vim'
" adds file finding capabilities
" Plug 'junegunn/fzf'
" fzf plugin for vim
" Plug 'junegunn/fzf.vim'
" adds emmet support to vim
" Plug 'mattn/emmet-vim'
" enables vim to show multiple cursors
" Plug 'terryma/vim-multiple-cursors'
" adds brackets to both sides of selectted text
" Plug 'tpope/vim-surround'
" ranger support for vim
" Plug 'francoiscabrol/ranger.vim'

call plug#end()

" plugin settings

"" nord settings
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
colorscheme nord

"" onedark settings
" set termguicolors
" colorscheme onedark

"" one settings
" syntax on
" colorscheme one
" set termguicolors

"" onehalfdark settings
" syntax on
" set termguicolors
" set t_Co=256
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

"" challenger settings
" colorscheme challenger_deep
" if has('nvim') || has('termguicolors')
" 	set termguicolors
" endif

"" NERDTree settings
let NERDTreeWinSize = 50

"" Airline settings
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" hard time settings
" let g:hardtime_default_on = 0

" autocommands

"" automatically open nerdtree when opening vim
" autocmd vimenter * NERDTree | wincmd w
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" When shortcut files are updated, renew bash and vifm configs with new material
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !~/.scripts/bookmarks/bmgen

"" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"" python files have tabs set to 4
autocmd FileType python setlocal autoindent noexpandtab tabstop=4 shiftwidth=4

"" commenstrings
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
autocmd FileType xdefaults set commentstring=!\ %s


" miscellaneous settings

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

filetype indent plugin on
syntax on

"" enable tabs

set autoindent noexpandtab tabstop=4 shiftwidth=4

"" listchars and stuff

set showbreak=↪

" set listchars=eol:⏎,tab:├─,trail:␠,nbsp:⎵
" set listchars=eol:⏎,tab:├─,trail:·
" set listchars=tab:├─,trail:·
" set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸─
" set list listchars=trail:·,tab:»·
" set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
" set list listchars=tab:▶─,nbsp:∙,trail:∙,extends:▶,precedes:◀
set list listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀


" my mappings

"" avoid the escape key
inoremap jk <esc>

"" nerdtree nerdtree
map <C-n> :NERDTreeToggle<CR>

"" insert blank line below/above
" nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" add mapping to move line up/down a certain number of lines
nnoremap <c-j> :m .+1<cr>==
nnoremap <c-k> :m .-2<cr>==

"" switching between buffers
nnoremap <c-l> :bn<cr>
nnoremap <c-h> :bp<cr>
"" deleting buffer
" :bd<cr>

"" leader mappings

" let mapleader = "-"
let mapleader = " "

" insert a single character before/after
" nnoremap <space> i_<esc>r
nnoremap <leader>i i_<esc>r
nnoremap <leader>a a_<esc>r

"" habit breaking

""" in normal mode, disable arrow keys

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

""" in normal mode, disable backspace/delete

nnoremap <BS> <Nop>
nnoremap <Del> <Nop>

""" in insert mode, disable arrow keys

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

