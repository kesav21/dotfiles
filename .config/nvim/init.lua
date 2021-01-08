-- vim: set foldmethod=marker:

-- options {{{

vim.o.updatetime    = 40
vim.o.timeoutlen    = 1000
vim.o.hlsearch      = true
vim.o.incsearch     = true
vim.o.timeout       = true
vim.o.exrc          = true
vim.o.secure        = true
vim.o.termguicolors = true
vim.o.background    = 'dark'
vim.o.inccommand    = 'split'
vim.o.clipboard     = 'unnamedplus'
vim.o.wildmode      = 'longest,list,full'
vim.o.shortmess     = vim.o.shortmess .. 'c'

vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.softtabstop = 4
vim.o.expandtab   = false

vim.wo.relativenumber = true
vim.wo.number         = true
vim.wo.cursorline     = true
vim.wo.list           = true
vim.wo.colorcolumn    = '88'
vim.wo.signcolumn     = 'yes'

vim.bo.modeline    = true

vim.cmd [[ set listchars=tab:›─,nbsp:∙,trail:∙,extends:▶,precedes:◀ ]] -- breaks if done in lua

vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax on ]]

-- }}}

-- mappings {{{

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q' , '<nop>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Y' , 'y$'   , {noremap = true})
vim.api.nvim_set_keymap('n', 'X' , 'xi'   , {noremap = true})
vim.api.nvim_set_keymap('v', 'p' , '"_dP' , {noremap = true})

vim.api.nvim_set_keymap('n', '<tab>'  , ':tabnext<cr>'    , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<s-tab>', ':tabprevious<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>e' , ':tabnew <c-r>=expand("%:p:h") . "/"<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cc', ':set colorcolumn=<cr>'                  , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cp', ':silent !xsel -ib < %<cr>'              , {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<f1>', ':make<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<f2>', ':!%:p<cr>', {noremap = true})

--- }}}

-- autocommands {{{

vim.cmd [[ augroup misc ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]
vim.cmd [[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]]
vim.cmd [[ autocmd BufWritePost *bm_dirs,*bm_files !bmgen ]]
vim.cmd [[ autocmd BufWritePost *dunstrc !killall -q dunst; dunst & ]]
vim.cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]
vim.cmd [[ autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup='Visual', timeout=250}) ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup format ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufWritePre * undojoin | Neoformat ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ augroup commentstrings ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd FileType asm        setlocal commentstring=#\ %s ]]
vim.cmd [[ autocmd FileType cpp        setlocal commentstring=//\ %s ]]
vim.cmd [[ autocmd FileType crontab    setlocal commentstring=#\ %s ]]
vim.cmd [[ autocmd FileType c          setlocal commentstring=//\ %s ]]
vim.cmd [[ autocmd FileType javascript setlocal commentstring=//\ %s ]]
vim.cmd [[ autocmd FileType markdown   setlocal commentstring=<!--\ %s\ --> ]]
vim.cmd [[ autocmd FileType matlab     setlocal commentstring=%\ %s ]]
vim.cmd [[ autocmd FileType typescript setlocal commentstring=//\ %s ]]
vim.cmd [[ autocmd FileType typescript setlocal commentstring=//\ %s ]]
vim.cmd [[ autocmd FileType xdefaults  setlocal commentstring=!\ %s ]]
vim.cmd [[ augroup END ]]

-- }}}

-- plugins {{{

vim.o.rtp = vim.o.rtp .. ',$HOME/projects/miniline.nvim'

vim.call('plug#begin', os.getenv('XDG_DATA_HOME') .. '/nvim/vim-plug')

vim.cmd [[ Plug 'gruvbox-community/gruvbox' ]] -- gruvbox theme
vim.cmd [[ Plug 'tpope/vim-commentary' ]] -- commenting
vim.cmd [[ Plug 'junegunn/fzf.vim' ]] -- file search
vim.cmd [[ Plug 'jiangmiao/auto-pairs' ]] -- bracket matching
vim.cmd [[ Plug 'tpope/vim-surround' ]] -- helps surround things
vim.cmd [[ Plug 'wellle/targets.vim' ]] -- more text objects
vim.cmd [[ Plug 'junegunn/vim-slash' ]] -- better searching
vim.cmd [[ Plug 'tommcdo/vim-lion' ]] -- code align
vim.cmd [[ Plug 'tpope/vim-repeat' ]] -- better repeating for plugins
vim.cmd [[ Plug 'sbdchd/neoformat' ]] -- code formatter
vim.cmd [[ Plug 'kovetskiy/sxhkd-vim' ]] -- sxhkd highlighting
vim.cmd [[ Plug 'dkarter/bullets.vim', { 'for': 'markdown' } ]] -- markdown bulleting
vim.cmd [[ Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } ]] -- completion menu
-- vim.cmd [[ Plug 'leafgarland/typescript-vim' ]] -- typescript highlighting
vim.cmd [[ Plug 'airblade/vim-gitgutter' ]] -- git integration
vim.cmd [[ Plug 'Yggdroot/indentLine' ]]
-- vim.cmd [[ Plug 'peitalin/vim-jsx-typescript' ]]
-- vim.cmd [[ Plug 'justinmk/vim-sneak' ]]
-- vim.cmd [[ Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' } ]]
-- vim.cmd [[ Plug 'Shougo/vimproc.vim', { 'do': 'make' } ]]
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter' ]]
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter-refactor' ]]
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter-textobjects' ]]
vim.cmd [[ Plug 'neovim/nvim-lspconfig' ]]
-- vim.cmd [[ Plug 'kesav21/miniline.nvim', { 'branch': 'main' } ]]
vim.cmd [[ Plug 'tpope/vim-fugitive' ]]
vim.cmd [[ Plug 'Shougo/deoplete-lsp' ]]
-- vim.cmd [[ Plug 'hashivim/vim-terraform' ]] -- TODO: check this out
-- vim.cmd [[ Plug 'nvim-lua/completion-nvim' ] -- TODO: check this out
-- vim.cmd [[ Plug 'sainnhe/edge' ] -- TODO: check this out

vim.call('plug#end')

-- }}}

-- plugin settings {{{

vim.g.lion_squeeze_spaces = 1

vim.g.fzf_tags_command = ''
vim.g.fzf_preview_window = ''

vim.g.gruvbox_italic = 1
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_light = 'hard'
vim.cmd [[ colorscheme gruvbox]]

vim.g.neoformat_enabled_python = {'black'}

vim.g.neoformat_enabled_sh = {'shfmt'}
vim.g.neoformat_sh_shfmt = { exe = 'shfmt', args = {'-p', '-i 0', '-ci'}, }

vim.g.neoformat_enabled_haskell = {'brittany'}

vim.g.neoformat_enabled_typescript = {'prettier'}
vim.g.neoformat_enabled_javascript = {'prettier'}

vim.g.neoformat_enabled_go = {'gofmt'}
vim.g.neoformat_go_gofmt = { exe = 'gofmt', args = {'-s'}, }

vim.g.neoformat_enabled_java = {'astyle'}
vim.g.neoformat_java_astyle = { exe = 'astyle', args = {'--indent=tab', '<'}, }

vim.g.neoformat_enabled_c = {}
vim.g.neoformat_enabled_cpp = {}
vim.g.neoformat_enabled_markdown = {}

vim.g['deoplete#enable_at_startup'] = 1

vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0

vim.g.indentLine_char = '›'
vim.g.indentLine_fileTypeExclude = {'tex'}

-- }}}

