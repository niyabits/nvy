local settings = require("settings")

local Utils = require('lsp/utils')
local common_on_attach = Utils.common_on_attach

-- Global Handlers
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})

-- TSServer
require('lsp/tsserver')

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

-- GO
require'lspconfig'.gopls.setup {on_attach = common_on_attach}

-- C Lang
require'lspconfig'.clangd.setup {
    on_attach = common_on_attach,
    cmd = {"clangd", "--background-index"},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic
                                                               .on_publish_diagnostics,
                                                           {
            virtual_text = settings["virtualText"],
            signs = false,
            underline = true,
            update_in_insert = true
        })
    }
}

-- Prisma
require 'lsp/prisma'
require'lspconfig'.prisma_ls.setup {on_attach = common_on_attach}

-- Emmet
-- require'lsp/emmet'
-- require'lspconfig'.emmet_ls.setup {on_attach = common_on_attach}

local configs = require 'lspconfig/configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not require'lspconfig'.emmet_ls then
    configs.emmet_ls = {
        default_config = {
            cmd = {'emmet-ls', '--stdio'},
            filetypes = {'html', 'css'},
            root_dir = function(fname) return vim.loop.cwd() end,
            settings = {}
        }
    }
end

require'lspconfig'.emmet_ls.setup {capabilities = capabilities}

-- Autoformat Buffers on Save
vim.cmd [[autocmd BufWritePre *.ts,*.lua,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 1000)]]

