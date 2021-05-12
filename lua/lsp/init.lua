require('lsp/utils')

-- Prettier
vim.cmd [[autocmd BufWritePre *.ts,*.lua,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 1000)]]

