if not vim.keymap then
	print("after/plugin/vim-slash.lua: install tjdevries/astronauta.nvim")
	return
end

local nnoremap = vim.keymap.nnoremap

-- center on search
nnoremap { '<plug>(slash-after)' , 'zz' }
