
local actions = require('telescope.actions')

actions.empty = function() end

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<c-n>"]  = actions.move_selection_next,
				["<c-p>"]  = actions.move_selection_previous,
				["<cr>"]   = actions.goto_file_selection_edit + actions.center,
				["<c-c>"]  = actions.close,
				["<down>"] = actions.empty,
				["<up>"]   = actions.empty,
				["<c-x>"]  = actions.empty,
				["<c-y>"]  = actions.empty,
				["<c-v>"]  = actions.empty,
				["<c-t>"]  = actions.empty,
				["<c-u>"]  = actions.empty,
				["<c-d>"]  = actions.empty,
				["<esc>"]  = actions.empty,
			},
			n = {
				["<esc>"]  = actions.empty,
				["<cr>"]   = actions.empty,
				["<c-x>"]  = actions.empty,
				["<c-v>"]  = actions.empty,
				["<c-t>"]  = actions.empty,
				["j"]      = actions.empty,
				["k"]      = actions.empty,
				["<down>"] = actions.empty,
				["<up>"]   = actions.empty,
				["<c-u>"]  = actions.empty,
				["<c-d>"]  = actions.empty,
			},
		},

		file_sorter    = require('telescope.sorters').get_fzy_sorter,
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,

		sorting_strategy = "ascending",
		prompt_position  = "top",
	}
}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("kesav.telescope-pickers").find_files()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>lua require("kesav.telescope-pickers").find_dirs()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("kesav.telescope-pickers").help_tags()<cr>', {noremap = true})
-- this is an awkward mapping
-- vim.api.nvim_set_keymap('t', '<c-\\>fd', '<c-\\><c-n>:lua require("kesav.telescope-pickers").terminal_cd()<cr>', {noremap = true, silent = true})
