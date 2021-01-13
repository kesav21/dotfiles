
local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<c-n>"]  = actions.move_selection_next,
				["<c-p>"]  = actions.move_selection_previous,
				["<c-y>"]  = actions.goto_file_selection_edit + actions.center,
				["<c-c>"]  = actions.close,
				["<down>"] = function() end,
				["<up>"]   = function() end,
				["<cr>"]   = function() end,
				["<c-x>"]  = function() end,
				["<c-v>"]  = function() end,
				["<c-t>"]  = function() end,
				["<c-u>"]  = function() end,
				["<c-d>"]  = function() end,
			},
			n = {
				["<esc>"]  = function() end,
				["<cr>"]   = function() end,
				["<c-x>"]  = function() end,
				["<c-v>"]  = function() end,
				["<c-t>"]  = function() end,
				["j"]      = function() end,
				["k"]      = function() end,
				["<down>"] = function() end,
				["<up>"]   = function() end,
				["<c-u>"]  = function() end,
				["<c-d>"]  = function() end,
			},
		},

		file_sorter    = require('telescope.sorters').get_fzy_sorter,
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,

		sorting_strategy = "ascending",
		prompt_position  = "top",
	}
}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("kesav.telescope-pickers").find_files()<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("kesav.telescope-pickers").help_tags()<cr>', {noremap = true})

