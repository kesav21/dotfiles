
local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<cr>"] = actions.goto_file_selection_tabedit
			},
		},
	}
}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>' , {noremap = true})
