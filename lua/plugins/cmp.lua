local Utils = require("utils")
local luasnip = require("luasnip")
local cmp = require("cmp")

local exprinoremap = Utils.exprinoremap

-- Little hacky function I got from —
-- https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/loaders/from_vscode.lua#L173-L180
local function get_snippets_rtp()
	return vim.tbl_map(function(itm)
		return vim.fn.fnamemodify(itm, ":h")
	end, vim.api.nvim_get_runtime_file(
		"package.json",
		true
	))
end

opts = {
	paths = {
		vim.fn.stdpath("config") .. "/snips/",
		get_snippets_rtp()[1],
	},
}

require("luasnip.loaders.from_vscode").lazy_load(opts)

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),

		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),

		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,

		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,

		["<C-Space>"] = cmp.mapping.complete(),

		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-c>"] = cmp.mapping.close(),
	},

	preselect = cmp.PreselectMode.None,

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
	},
})
