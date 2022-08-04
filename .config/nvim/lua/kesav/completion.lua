local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
	print "lua/kesav/completion.lua: install hrsh7th/nvim-cmp"
	return
end
local has_lspkind, lspkind = pcall(require, "lspkind")
if not has_lspkind then
	print "lua/kesav/completion.lua: install onsails/lspkind.nvim"
	return
end
local has_luasnip, luasnip = pcall(require, "luasnip")
if not has_luasnip then
	print "lua/kesav/completion.lua: install L3MON4D3/LuaSnip"
	return
end

vim.o.completeopt = "menuone,noinsert,noselect"

vim.cmd [[imap <c-e> <nop>]]

cmp.setup {
	mapping = cmp.mapping.preset.insert {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		-- ["<C-e>"] = cmp.mapping.abort(),
		-- ["<c-y>"] = cmp.mapping.confirm {
		-- 	behavior = cmp.ConfirmBehavior.Insert,
		-- 	select = true,
		-- },
		-- ["<c-e>"] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
		-- ["<c-i>"] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
		-- ["<c-o>"] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.confirm()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
		-- ["<c-e>"] = function()
		-- 	cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
		-- end,
		["<c-i>"] = function()
			cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
		end,
		["<c-o>"] = function()
			cmp.confirm()
		end,
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 3 },
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[nvim]",
				path = "[path]",
				luasnip = "[snip]",
			},
		},
	},
	experimental = {
		ghost_text = true,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
}
