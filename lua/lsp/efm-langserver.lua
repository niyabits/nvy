local luaFormat = {formatCommand = "lua-format -i", formatStdin = true}

local prettier = {
    formatCommand = "prettier ${INPUT} --loglevel error",
    formatStdin = true
}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    rootMarkers = {
        '', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml',
        '.eslintrc.json', '.git', 'package.json'
    }
}

require"lspconfig".efm.setup {
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false
            })
    },

    init_options = {documentFormatting = true},

    -- TODO: Add typescriptreact and javascriptreact
    filetypes = {
        "typescript", "javascript", 'typescriptreact', 'javascriptreact', "lua"
    },

    settings = {
        rootMarkers = {"package.json", "tsconfig.json", ".git/"},
        languages = {
            lua = {luaFormat},
            -- TODO: Add Prettier after ESLint is fixed
            typescript = {eslint, prettier},
            javascript = {eslint, prettier},
            typescriptreact = {eslint, prettier},
            javascriptreact = {eslint, prettier}
        }
    }
}
