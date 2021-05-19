local Utils = require('lsp/utils')
local common_on_attach = Utils.common_on_attach

-- TSServer
require'lspconfig'.tsserver.setup {
    on_attach = require('lsp/tsserver').tsserver_on_attach
}

-- Lua Server
require'lspconfig'.sumneko_lua.setup(require("lsp.sumneko_lua"))

-- efm general language server
require'lspconfig'.efm.setup(require("lsp.efm-langserver"))

-- CSS
-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {on_attach = common_on_attach}

-- GraphQL
require'lspconfig'.graphql.setup {on_attach = common_on_attach}

-- HTML
require'lspconfig'.html.setup {on_attach = common_on_attach}

-- JSON
require'lspconfig'.jsonls.setup {on_attach = common_on_attach}

-- Autoformat Buffers on Save
vim.cmd [[autocmd BufWritePre *.ts,*.lua,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 1000)]]

