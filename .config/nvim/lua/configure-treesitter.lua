require'nvim-treesitter.configs'.setup{
	ensure_installed = {
		"c",
		"cpp",
		"bash",
		"python",
		"typescript",
		"lua",
		"javascript",
		"query",
		"go",
		-- "markdown",
		-- "html",
		-- "json",
	},
	highlight = {
		enable = true,
		custom_captures = {
			-- constant?
			-- constant.builtin?

			-- markdown
			-- ["text.title"] = "GruvboxYellowBold",
			-- ["text.literal"] = "GruvboxAqua",
			-- ["text.strong"] = "GruvboxGray",
			-- ["text.emphasis"] = "GruvboxGray",
			-- ["text.uri"] = "GruvboxPurple",
			-- ["none"] = "GruvboxGray",

			-- html
			-- ["tag"] = "GruvboxAqua",
			-- ["tag.delimiter"] = "GruvboxAqua",
			-- ["error"] = "GruvboxRed",

			-- json
			-- ["constant.builtin"] = "GruvboxPurple",
			-- ["label"] = "GruvboxAqua",
			-- ["string"] = "GruvboxGreen",
			-- ["string.escape"] = "GruvboxGreen",
			-- ["constant.builtin"] = "GruvboxPurple",

			["constant.macro"] = "TSKeyword",
			["include"] = "TSKeyword",

			["variable.builtin"] = "GruvboxAqua",

			-- this looks weird
			["constructor"] = "GruvboxYellow",
			["type"] = "GruvboxYellow",
			["type.builtin"] = "GruvboxYellow",

			["method"] = "GruvboxAqua",
			["function"] = "GruvboxAqua",
			-- a python builtin function 'chr' was in orange instead of aqua
			["function.builtin"] = "GruvboxAqua",

			-- ["include"] = "TSKeyword",
			-- ["operator"] = "TSKeyword",
			["keyword.operator"] = "TSKeyword",

			["punctuation.bracket"] = "TSNone",
			["punctuation.special"] = "TSNone",
			["punctuation.delimiter"] = "TSNone",

			-- ["variable.parameter"] = "TSParameter"
			["parameter"] = "TSNone", -- for now
		}
	},
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = { smart_rename = "<leader>r" }
		},
		navigation = {
			enable = true,
			keymaps = { goto_definition = "gd" }
		}
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			}
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sn"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>sp"] = "@parameter.inner",
			}
		}
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gns",
			node_incremental = "gni",
			node_decremental = "gnd",
			-- scope_incremental = "grc",
		},
	}
}
