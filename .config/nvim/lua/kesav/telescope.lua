local ok, telescope = pcall(require, "telescope")
if not ok then
	print "lua/kesav/telescope.lua: install nvim-telescope/telescope.nvim"
	return
end

local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local sorters = require "telescope.sorters"

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

-- vim.keymap.set("n", "<leader>fs", builtin.grep_string)
vim.keymap.set("n", "<leader>fr", builtin.registers)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>ts", builtin.treesitter)
vim.keymap.set("n", "<leader>ch", builtin.command_history)
vim.keymap.set("n", "<leader>sh", builtin.search_history)
vim.keymap.set("n", "<leader><leader>gs", builtin.git_status)
vim.keymap.set("n", "<leader>ff", function()
	return builtin.find_files {
		find_command = {
			"fd",
			"--hidden",
			"--no-ignore-vcs",
			"--type",
			"file",
		},
	}
end)
vim.keymap.set("n", "<leader>ld", function()
	return pickers.new({
		prompt_title = "Load Runtime Files",
		finder = finders.new_table(vim.api.nvim_get_runtime_file("**", true)),
		sorter = sorters.get_fzy_sorter(),
		attach_mappings = function()
			action_set.select:replace(function(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				local module = loadfile(selection.display)
				module()
			end)
			return true
		end,
	}):find()
end)

telescope.load_extension "ui-select"
