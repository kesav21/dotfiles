
" Plugins

call plug#begin()

" syntax highlighting for i3 config
Plug 'PotatoesMaster/i3-vim-syntax'
" adds a directory tree
Plug 'scrooloose/nerdtree'
" adds nord theme to vim
Plug 'arcticicestudio/nord-vim'
" adds airline status bar to vim
Plug 'vim-airline/vim-airline'
" faster commenting
Plug 'tpope/vim-commentary'
" git plugin (airline requires)
Plug 'tpope/vim-fugitive'

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

" Plugin settings

"" Nord settings
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
colorscheme nord

"" NERDTree settings
autocmd vimenter * NERDTree | wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinSize = 50
map <C-n> :NERDTreeToggle<CR>

"" Airline settings
set timeoutlen=10
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" miscellaneous settings

set number relativenumber
set cursorline
set wildmode=longest,list,full
set laststatus=0
set noshowmode
set noruler
set noshowcmd
set hls is
set modeline
set tabstop=4

"" Ctrl-j/k inserts blank line below/above
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

