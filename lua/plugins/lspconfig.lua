local nvim_lsp = require("lspconfig")
local utils = require("lsp/utils")
local common_on_attach = utils.common_on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Column Sign for Diagnostics
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Enable the following language servers
local servers = { "clangd", "rust_analyzer", "pyright", "cssls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = common_on_attach,
		capabilities = capabilities,
	})
end

require("lsp/null-ls")
require("lsp/tsserver")

-- Format on Save
vim.cmd(
	[[autocmd BufWritePre *.ts,*.lua,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 1000)]]
)
