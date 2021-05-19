local utils = require('lsp/utils')
local isWindows = utils.isWindows

local library = {}

local path = vim.split(package.path, ";")

local lua_bin = 'lua-language-server'

-- this is the ONLY correct way to setup your path
if isWindows() then
    table.insert(path, "lua\\?.lua")
    table.insert(path, "lua\\?\\init.lua")
else
    table.insert(path, "lua/?.lua")
    table.insert(path, "lua/?/init.lua")
end

-- add plugins
-- if you're not using packer, then you might need to change the paths below
library = {
    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
}

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local sumneko_root_path = "C:/Users/yashg/bin/lua-language-server"

-- LuaFormatter off
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
-- LuaFormatter on

return {
    cmd = {lua_bin, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = path
            },
            completion = {callSnippet = "Both"},
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = library,
                maxPreload = 2000,
                preloadFileSize = 50000
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}
