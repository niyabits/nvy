local luaFormat = {formatCommand = "lua-format -i", formatStdin = true}

local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local eslint = {
    lintCommand = "eslint_d -f stylish --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    rootMarkers = {
        '', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml',
        '.eslintrc.json', '.git', 'package.json'
    }
}

return {
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false
            })
    },

    init_options = {documentFormatting = true, codeAction = false},

    filetypes = {
        "lua", "html", "css", "json"
    },

    settings = {
        rootMarkers = {"package.json", "tsconfig.json", ".git/"},
        languages = {
            lua = {luaFormat},
            html = {prettier},
            css = {prettier},
            json = {prettier}
--          typescript = {prettier, eslint},
--          javascript = {prettier, eslint},
--          typescriptreact = {prettier, eslint},
--          javascriptreact = {prettier, eslint},
        }
    }
}
