local null_ls = require("null-ls")
local utils = require("lsp/utils")
local common_on_attach = utils.common_on_attach

null_ls.config({
	-- you must define at least one source for the plugin to work
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.write_good,
	},
})

require("lspconfig")["null-ls"].setup({
	-- see the nvim-lspconfig documentation for available configuration options
	on_attach = function(client)
		common_on_attach(client)

		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
})
