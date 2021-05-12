-- TypeScript Server
require'lspconfig'.tsserver.setup {
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },

    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    root_dir = require('lspconfig/util').root_pattern("package.json",
                                                      "tsconfig.json",
                                                      "jsconfig.json", ".git"),
    -- Disbale TSServer Formatting
    on_attach = function(client)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false
    end,

    -- Disable Virtual Text
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false
            })
    }
}

