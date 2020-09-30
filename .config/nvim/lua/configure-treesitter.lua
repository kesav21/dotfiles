require'nvim-treesitter.configs'.setup{
	ensure_installed = {"c", "bash", "python", "typescript" },
	highlight = { enable = true },
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
