
local M = {}

local builtin = require('telescope.builtin')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')

local utils = require('telescope.utils')
local make_entry = require('telescope.make_entry')

function M.find_files()
	builtin.find_files {
		find_command = { 'fd', '--hidden', '--no-ignore-vcs', '--type', 'file', },
	}
end

function M.find_dirs()
	pickers.new {
		prompt_title = 'Find Directories',
		finder = finders.new_oneshot_job { 'fd', '--hidden', '--no-ignore-vcs', '--type', 'directory', },
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

function M.git_add()
	local opts = { cwd = '.' }
	local output = utils.get_os_command_output(
		{ 'git', 'status', '--short', '--untracked-files=all' },
		opts.cwd
	)

	if #output == 0 then
		print("no changes found")
	else
		builtin.git_status {
			finder = finders.new_table {
				results = output,
				entry_maker = make_entry.gen_from_git_status(opts)
			},
		}
	end
end

return M
