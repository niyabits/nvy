-- TypeScript Server
require'lspconfig'.tsserver.setup{
    on_attach = function(client)
        if client.config.flags then client.config.flags.allow_incremental_sync = true end
        client.resolved_capabilities.document_formatting = false
    end,

	handlers = {
	 ["textDocument/publishDiagnostics"] = vim.lsp.with(
	   vim.lsp.diagnostic.on_publish_diagnostics, {
		 -- Disable virtual_text
		 virtual_text = false
	   }
	 ),
	}
}

-- ESLint

-- Prettier
