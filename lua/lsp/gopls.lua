local nvim_lsp = require("lspconfig")
local utils = require("lsp/utils")
local common_on_attach = utils.common_on_attach

require("lspconfig").gopls.setup({
	on_attach = function(client, bufnr)
		common_on_attach(client)

		-- Disable formatting
		client.resolved_capabilities.document_formatting = false
	end,
	capabilities = capabilities,
})
