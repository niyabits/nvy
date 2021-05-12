-- Lua Sumneko 
local function isWindows() return package.config:sub(1, 1) == '\\' end

local lua_bin = isWindows() and 'lua-language-server.exe' or
                    'lua-language-server'

require'lspconfig'.sumneko_lua.setup {
    cmd = {lua_bin},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },

            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME\\lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME\\lua\\vim\\lsp')] = true
                }
            }
        }
    }
}

