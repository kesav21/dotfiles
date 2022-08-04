local packer_bootstrap
local install_path = vim.fn.stdpath "data"
	.. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
end

local packer = require "packer"

return packer.startup {
	function(use)
		use {
			"wbthomason/packer.nvim",
			config = function()
				vim.keymap.set("n", "<leader>pi", "<cmd>PackerInstall<cr>")
				vim.keymap.set("n", "<leader>pu", "<cmd>PackerUpdate<cr>")
				vim.keymap.set("n", "<leader>pc", "<cmd>PackerClean<cr>")
			end,
		}
		use {
			"gruvbox-community/gruvbox",
			config = function()
				vim.g.gruvbox_italic = 1
				vim.g.gruvbox_invert_selection = 0
				vim.g.gruvbox_contrast_dark = "hard"
				vim.g.gruvbox_contrast_light = "hard"
				--
				if vim.g.colors_name ~= "gruvbox" then
					vim.cmd [[colorscheme gruvbox]]
				end
				--
				vim.cmd [[hi! link DiffAdd    GruvboxGreen]]
				vim.cmd [[hi! link DiffChange GruvboxRed]]
				vim.cmd [[hi! link DiffDelete GruvboxRed]]
				vim.cmd [[hi! link EndOfBuffer GruvboxBg0]]
				--
				vim.cmd [[hi! SignColumn  guibg=#1d2021 guifg=#a89984]]
				vim.cmd [[hi! GitAdd      guibg=#1d2021 guifg=#b8bb26]]
				vim.cmd [[hi! GitChange   guibg=#1d2021 guifg=#8ec07c]]
				vim.cmd [[hi! GitDelete   guibg=#1d2021 guifg=#fb4934]]
				vim.cmd [[hi! LineNr      guibg=#1d2021 guifg=#a89984]]
				vim.cmd [[hi! GitAddNr    guibg=#1d2021 guifg=#b8bb26]]
				vim.cmd [[hi! GitChangeNr guibg=#1d2021 guifg=#8ec07c]]
				vim.cmd [[hi! GitDeleteNr guibg=#1d2021 guifg=#fb4934]]
				--
				vim.cmd [[hi! link Function GruvboxAqua]]
				vim.cmd [[hi! link Operator Keyword]]
				vim.cmd [[hi! link Special GruvboxNone]]
			end,
		}
		-- use {
		-- 	"tpope/vim-commentary",
		-- 	config = function()
		-- 		vim.cmd [[nmap <c-_> <Plug>CommentaryLine]]
		-- 		vim.cmd [[vmap <c-_> <Plug>Commentary]]
		-- 	end,
		-- }
		use {
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		}
		use "jiangmiao/auto-pairs"
		use "tpope/vim-surround"
		use "wellle/targets.vim"
		use {
			"junegunn/vim-slash",
			opt = true, -- this forces config to run after plugin load, not sure why
			config = function()
				vim.cmd [[nnoremap <plug>(slash-after) zz]]
				vim.keymap.set("n", "n", "<left>")
			end,
		}
		use {
			"tommcdo/vim-lion",
			config = function()
				vim.g.lion_squeeze_spaces = 1
			end,
		}
		use "tpope/vim-repeat"
		use "kovetskiy/sxhkd-vim"
		-- use { "dkarter/bullets.vim", ft = "markdown" }
		use {
			"Yggdroot/indentLine",
			config = function()
				vim.g.indentLine_char = "›"
				vim.g.indentLine_fileTypeExclude = { "tex" }
			end,
		}
		use "nvim-treesitter/nvim-treesitter"
		use "nvim-treesitter/playground"
		use "nvim-treesitter/nvim-treesitter-refactor"
		use "nvim-treesitter/nvim-treesitter-textobjects"
		use "neovim/nvim-lspconfig"
		use {
			"tjdevries/express_line.nvim",
			requires = "nvim-lua/plenary.nvim",
		}
		use {
			"tpope/vim-fugitive",
			config = function()
				vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>")
			end,
		}
		use "dstein64/vim-startuptime"
		use "neovimhaskell/haskell-vim"
		-- use "nvim-lua/completion-nvim"
		use {
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		}
		use "AndrewRadev/splitjoin.vim"
		use "hashivim/vim-terraform"
		-- use "JoosepAlviste/nvim-ts-context-commentstring"
		use {
			"lewis6991/gitsigns.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("gitsigns").setup {
					signs = {
						add = {
							text = "+",
							hl = "GitAdd",
							numhl = "GitAddNr",
						},
						change = {
							text = "~",
							hl = "GitChange",
							numhl = "GitChangeNr",
						},
						delete = {
							text = "⌄",
							hl = "GitDelete",
							numhl = "GitDeleteNr",
						},
						topdelete = {
							text = "^",
							hl = "GitDelete",
							numhl = "GitDeleteNr",
						},
						changedelete = {
							text = "~",
							hl = "GitDelete",
							numhl = "GitDeleteNr",
						},
					},
					numhl = true,
				}
				vim.keymap.set("n", "<leader>ge", "<cmd>Gitsigns next_hunk<cr>")
				vim.keymap.set("n", "<leader>gi", "<cmd>Gitsigns prev_hunk<cr>")
				vim.keymap.set(
					"n",
					"<leader>gs",
					"<cmd>Gitsigns stage_hunk<cr>"
				)
				vim.keymap.set(
					"n",
					"<leader>gu",
					"<cmd>Gitsigns unstage_hunk<cr>"
				)
				vim.keymap.set(
					"n",
					"<leader>gr",
					"<cmd>Gitsigns reset_hunk<cr>"
				)
				vim.keymap.set(
					"n",
					"<leader>gg",
					"<cmd>Gitsigns preview_hunk<cr>"
				)
			end,
		}
		use "mhartington/formatter.nvim"
		use {
			"phaazon/hop.nvim",
			as = "hop",
			config = function()
				require("hop").setup()
				vim.cmd [[hi! link HopNextKey GruvboxRedBold]]
				vim.cmd [[hi! link HopNextKey1 GruvboxRedBold]]
				vim.cmd [[hi! link HopNextKey2 GruvboxRed]]
				vim.cmd [[hi! link HopUnmatched GruvboxGray]]
				vim.cmd [[nnoremap \ :HopWord<cr>]]
			end,
		}
		use "simrat39/rust-tools.nvim"
		use "nvim-telescope/telescope-ui-select.nvim"
		use "tpope/vim-abolish"
		-- completion
		use "hrsh7th/nvim-cmp"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-nvim-lua"
		use "hrsh7th/cmp-nvim-lsp"
		use "L3MON4D3/LuaSnip"
		use "saadparwaiz1/cmp_luasnip"
		use "onsails/lspkind.nvim"
		--
		use "numToStr/Comment.nvim"
		--
		-- TODO: check these out
		-- use "arthurxavierx/vim-caser"
		-- use 'sainnhe/edge'
		-- use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
		--
		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
}
