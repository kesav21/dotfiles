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
