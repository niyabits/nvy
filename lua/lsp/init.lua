require('lsp/utils')

-- TypeScript Server
require'lspconfig'.tsserver.setup {

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

-- Lua Sumneko 
local function isWindows() return package.config:sub(1, 1) == '\\' end

local lua_bin = isWindows() and 'lua-language-server.exe' or
                    'lua-language-server'

require'lspconfig'.sumneko_lua.setup {cmd = {lua_bin}}

-- Prettier
vim.cmd [[autocmd BufWritePre *.ts,*.lua,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 1000)]]
