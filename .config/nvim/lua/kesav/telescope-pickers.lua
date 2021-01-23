
local M = {}

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

function M.find_files()
	builtin.find_files {
		find_command = { 'fd', '--hidden', '--type', 'file', },
		attach_mappings = function(prompt_bufnr)
			actions._goto_file_selection:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd('tabedit ' .. selection.value)
			end)
			return true
		end,
	}
end

function M.find_dirs()
	builtin.find_files {
		prompt_title = 'Find Directories',
		find_command = { 'fd', '--hidden', '--type', 'directory', },
		attach_mappings = function(prompt_bufnr)
			actions._goto_file_selection:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd('cd ' .. selection.value)
			end)
			return true
		end,
	}
end

local function first(iterator)
	for i in iterator do
		return i
	end
end

function M.terminal_cd()
	local line = vim.fn.getline('.')
	local cwd = first(string.gmatch(line, '%[(.+)%]'))
	local full_cwd = vim.fn.fnamemodify(cwd, ':p')

	builtin.find_files {
		prompt_title = 'Find Directories',
		find_command = { 'fd', '--hidden', '--type', 'directory', '--base-directory', full_cwd },
		attach_mappings = function(prompt_bufnr)
			actions._goto_file_selection:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				local id = vim.b.terminal_job_id
				vim.fn.chansend(id, 'cd ' .. selection.value .. '\n')
				vim.fn.feedkeys('i')
			end)
			return true
		end,
	}
end

function M.help_tags()
	builtin.help_tags {
		attach_mappings = function(prompt_bufnr)
			actions._goto_file_selection:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd('tab help ' .. selection.value)
			end)
			return true
		end,
	}
end

return M
