
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function()
	use { 'wbthomason/packer.nvim', opt = true }
	use { 'gruvbox-community/gruvbox' }                          -- gruvbox theme
	use { 'tpope/vim-commentary' }                               -- commenting
	use { 'junegunn/fzf.vim' }                                   -- file search
	use { 'jiangmiao/auto-pairs' }                               -- bracket matching
	use { 'tpope/vim-surround' }                                 -- helps surround things
	use { 'wellle/targets.vim' }                                 -- more text objects
	use { 'junegunn/vim-slash' }                                 -- better searching
	use { 'tommcdo/vim-lion' }                                   -- code align
	use { 'tpope/vim-repeat' }                                   -- better repeating for plugins
	use { 'sbdchd/neoformat' }                                   -- code formatter
	use { 'kovetskiy/sxhkd-vim' }                                -- sxhkd highlighting
	use { 'dkarter/bullets.vim', ft = { 'markdown' } }           -- markdown bulleting
	use { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' } -- completion menu
	-- use { 'leafgarland/typescript-vim' }                      -- typescript highlighting
	use { 'airblade/vim-gitgutter' }                             -- git integration
	use { 'Yggdroot/indentLine' }
	-- use { 'peitalin/vim-jsx-typescript' }
	-- use { 'justinmk/vim-sneak' }
	-- use { 'Quramy/tsuquyomi', run = 'npm -g install typescript' }
	-- use { 'Shougo/vimproc.vim', run = 'make' }
	use { 'nvim-treesitter/nvim-treesitter' }
	use { 'nvim-treesitter/nvim-treesitter-refactor' }
	use { 'nvim-treesitter/nvim-treesitter-textobjects' }
	use { 'neovim/nvim-lspconfig' }
	use { 'kesav21/miniline.nvim', branch = 'main' }
	use { 'tpope/vim-fugitive' }
	use { 'Shougo/deoplete-lsp' }
	-- use { 'hashivim/vim-terraform' }                          -- TODO: check this out
	-- use { 'nvim-lua/completion-nvim' }                        -- TODO: check this out
	-- use { 'sainnhe/edge' }                                    -- TODO: check this out
end)
