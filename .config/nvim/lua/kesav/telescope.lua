local ok, telescope = pcall(require, "telescope")
if not ok then
	print "lua/kesav/telescope.lua: install nvim-telescope/telescope.nvim"
	return
end

local actions = require "telescope.actions"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"

actions.empty = function() end

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<c-n>"] = actions.move_selection_next,
				["<c-p>"] = actions.move_selection_previous,
				-- ["<cr>"]   = actions.goto_file_selection_tabedit + actions.center,
				["<c-c>"] = actions.close,
				["<down>"] = actions.empty,
				["<up>"] = actions.empty,
				["<c-x>"] = actions.empty,
				["<c-y>"] = actions.empty,
				["<c-v>"] = actions.empty,
				["<c-t>"] = actions.empty,
				["<c-u>"] = actions.empty,
				["<c-d>"] = actions.empty,
				["<esc>"] = actions.empty,
			},
			n = {
				["<esc>"] = actions.empty,
				["<cr>"] = actions.empty,
				["<c-x>"] = actions.empty,
				["<c-v>"] = actions.empty,
				["<c-t>"] = actions.empty,
				["j"] = actions.empty,
				["k"] = actions.empty,
				["<down>"] = actions.empty,
				["<up>"] = actions.empty,
				["<c-u>"] = actions.empty,
				["<c-d>"] = actions.empty,
			},
		},
		file_sorter = sorters.get_fzy_sorter,
		file_previewer = previewers.vim_buffer_cat.new,
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
}

vim.cmd [[cnoreabbrev fb lua require("telescope.builtin").buffers { show_all_buffers = true }]]
vim.cmd [[cnoreabbrev ff lua require("telescope.builtin").find_files { find_command = { 'fd', '--hidden', '--no-ignore-vcs', '--type', 'file' } }]]
vim.cmd [[cnoreabbrev fh lua require("telescope.builtin").help_tags()]]
vim.cmd [[cnoreabbrev ts lua require("telescope.builtin").treesitter()]]
