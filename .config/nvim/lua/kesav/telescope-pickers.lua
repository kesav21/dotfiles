
local M = {}

local actions = require('telescope.actions')

function M.find_files()
	require('telescope.builtin').find_files {
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

function M.help_tags()
	require('telescope.builtin').help_tags {
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
