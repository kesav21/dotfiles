require'nvim-treesitter.configs'.setup{
	ensure_installed = {"c", "bash", "python", "typescript", "lua" },
	highlight = {
		enable = true,
		custom_captures = {
			-- ["variable.parameter"] = "TSParameter"

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
			["punctuation.delimiter"] = "TSNone"
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
	}
}
