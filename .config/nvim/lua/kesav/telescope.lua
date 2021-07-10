
local telescope  = require('telescope')
local actions    = require('telescope.actions')
local sorters    = require('telescope.sorters')
local previewers = require('telescope.previewers')
local custom     = require("kesav.telescope-pickers")
local builtin    = require("telescope.builtin")

actions.empty = function() end

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<c-n>"]  = actions.move_selection_next,
				["<c-p>"]  = actions.move_selection_previous,
				-- ["<cr>"]   = actions.goto_file_selection_tabedit + actions.center,
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

		file_sorter    = sorters.get_fzy_sorter,
		file_previewer = previewers.vim_buffer_cat.new,

		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
}

local nnoremap = vim.keymap.nnoremap

nnoremap { '<leader>fb', custom.buffers }
nnoremap { '<leader>ff', custom.find_files }
nnoremap { '<leader>fd', custom.find_dirs }
nnoremap { '<leader>fh', builtin.help_tags }

nnoremap { '<leader>ga', custom.git_add }

-- this is an awkward mapping
-- vim.api.nvim_set_keymap('t', '<c-\\>fd', '<c-\\><c-n>:lua require("kesav.telescope-pickers").terminal_cd()<cr>', {noremap = true, silent = true})
