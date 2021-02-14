
local M = {}

local builtin = require('telescope.builtin')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')

function M.find_files()
	builtin.find_files {
		find_command = { 'fd', '--hidden', '--type', 'file', },
	}
end

function M.find_dirs()
	pickers.new {
		prompt_title = 'Find Directories',
		finder = finders.new_oneshot_job { 'fd', '--hidden', '--type', 'directory', },
		sorter = sorters.get_fzy_sorter {},
		attach_mappings = function(prompt_bufnr)
			actions._goto_file_selection:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd('cd ' .. selection.value)
			end)
			return true
		end,
	}:find()
end

function M.buffers()
	builtin.buffers { show_all_buffers = true }
end

return M
