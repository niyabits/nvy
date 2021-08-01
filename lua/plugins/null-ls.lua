require("null-ls").config({
    -- you must define at least one source for the plugin to work
    sources = { require("null-ls").builtins.formatting.stylua }
})

require("lspconfig")["null-ls"].setup({
    -- see the nvim-lspconfig documentation for available configuration options
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end
    end 
})
