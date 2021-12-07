local null_ls = require("null-ls")

null_ls.config({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d, -- eslint or eslint_d
		null_ls.builtins.code_actions.eslint_d, -- eslint or eslint_d
		null_ls.builtins.formatting.prettier, -- prettier, eslint, eslint_d, or prettierd
		null_ls.builtins.formatting.rustfmt, -- Rust
	},
})

require("lspconfig")["null-ls"].setup({
	-- or to a common on_attach callback to enable for all supported filetypes
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
