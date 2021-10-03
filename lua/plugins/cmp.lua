local Utils = require("utils")
local exprinoremap = Utils.exprinoremap

local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<C-Space>"] = cmp.mapping.complete(),
	},
	sources = {
		{ name = "nvim_lsp" },
	},
})
