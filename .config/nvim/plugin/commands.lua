_G.kesav = {}

function _G.kesav.commit(message)
	if string.len(message) <= 50 then
		vim.cmd(string.format([[!git commit --gpg-sign --message '%s']], message))
	else
		-- TODO: open message in "$(git rev-parse --show-toplevel)"/.git/COMMIT_EDITMSG
		print("commit message too long")
	end
end
vim.cmd [[command -nargs=1 GitCommit lua kesav.commit("<args>")]]
vim.cmd [[cnoreabbrev commit GitCommit]]

vim.cmd [[command Bd bp|bd#]]
vim.cmd [[cnoreabbrev bd Bd]]

vim.cmd [[cnoreabbrev tsp TSP]]

function _G.kesav.newfile()
	vim.api.nvim_feedkeys(
		string.format(
			":edit %s/",
			vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
		),
		"n",
		true
	)
end
vim.cmd [[cnoreabbrev newf lua kesav.newfile()]]

function _G.kesav.copyfile()
	vim.cmd [[silent !xsel -ib < %]]
end
vim.cmd [[cnoreabbrev copyf lua kesav.copyfile()]]

function _G.kesav.runfile()
	vim.cmd [[!%:p]]
end
vim.cmd [[cnoreabbrev runf lua kesav.runfile()]]

function _G.kesav.togglecolumns()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = "88"
	else
		vim.wo.colorcolumn = ""
	end
end
vim.cmd [[cnoreabbrev cols lua kesav.togglecolumns()]]
