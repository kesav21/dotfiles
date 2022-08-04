local M = {}

function M.command(arg)
	local event = arg["event"]
	arg["event"] = nil
	return vim.api.nvim_create_autocmd(event, arg)
end

function M.group(name)
	local group = vim.api.nvim_create_augroup(name, { clear = true })
	return function(arg)
		local event = arg.event
		arg.event = nil
		arg.group = group
		vim.api.nvim_create_autocmd(event, arg)
	end
end

return M
