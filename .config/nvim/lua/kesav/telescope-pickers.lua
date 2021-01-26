
local M = {}

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- local Job = require('plenary.job')

-- local function os_execute_output(cmd)
-- 	local command = table.remove(cmd, 1)
-- 	return Job:new({ command = command, args = cmd }):sync()
-- end

function M.find_files()
	builtin.find_files {
		find_command = { 'fd', '--hidden', '--type', 'file', },
		attach_mappings = function(prompt_bufnr)
			actions._select:replace(function()
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
			actions._select:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd('cd ' .. selection.value)
			end)
			return true
		end,
	}
end

-- function M.terminal_cd()
-- 	local id = vim.b.terminal_job_id
-- 	local pid = vim.fn.jobpid(id)
-- 	local cwd_output = os_execute_output {
-- 		"readlink",
-- 		"-e",
-- 		"/proc/" .. pid .."/cwd",
-- 	}
-- 	local cwd = cwd_output[1]

-- 	builtin.find_files {
-- 		prompt_title = 'Find Directories',
-- 		find_command = { 'fd', '--hidden', '--type', 'directory', '--base-directory', cwd },
-- 		attach_mappings = function(prompt_bufnr)
-- 			actions._goto_file_selection:replace(function()
-- 				local selection = actions.get_selected_entry()
-- 				actions.close(prompt_bufnr)
-- 				vim.fn.chansend(id, 'cd ' .. selection.value .. '\n')
-- 				vim.fn.feedkeys('i')
-- 			end)
-- 			return true
-- 		end,
-- 	}
-- end

function M.help_tags()
	builtin.help_tags {
		attach_mappings = function(prompt_bufnr)
			actions._select:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd('tab help ' .. selection.value)
			end)
			return true
		end,
	}
end

return M
