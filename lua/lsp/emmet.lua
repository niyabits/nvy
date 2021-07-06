local lspconfig = require 'lspconfig'
local configs = require "lspconfig/configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.emmet_ls = {
    default_config = {
        cmd = {"emmet-ls", "--stdio"},
        filetypes = {
            "html", "css", "typescript", "typescriptreact", "javascript",
            "javascriptreact"
        },
        root_dir = function() return vim.loop.cwd() end,
        settings = {}
    }
}
