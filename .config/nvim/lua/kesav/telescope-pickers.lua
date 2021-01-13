
local M = {}

local actions = require('telescope.actions')

function M.find_files()
	require('telescope.builtin').find_files {
		find_command = { 'fd', '--hidden', '--type', 'file', },
		attach_mappings = function(prompt_bufnr)
			actions.goto_file_selection_edit:replace(function()
				actions.goto_file_selection_tabedit(prompt_bufnr)
			end)
			return true
		end,
	}
end

function M.help_tags()
	require('telescope.builtin').help_tags {
	  attach_mappings = function(prompt_bufnr)
			actions.goto_file_selection_edit:replace(function()
				actions.goto_file_selection_tabedit(prompt_bufnr)
			end)
			return true
		end,
	}
end

return M
