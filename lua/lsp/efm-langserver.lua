local Utils = require('lsp/utils')
local system_name = Utils.getSystemName()

local luaFormatBin = vim.fn.stdpath("config") .. "/bin/lua-format/" ..
                         system_name .. "/lua-format"
local luaFormat = {formatCommand = luaFormatBin .. " -i", formatStdin = true}

local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

return {
    init_options = {documentFormatting = true, codeAction = false},

    filetypes = {"lua", "html", "css", "json"},

    settings = {
        rootMarkers = {"package.json", "tsconfig.json", ".git/"},
        languages = {
            lua = {luaFormat},
            html = {prettier},
            css = {prettier},
            json = {prettier}
        }
    }
}
