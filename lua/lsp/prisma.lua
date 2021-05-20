local utils = require('lsp/utils')
local isWindows = utils.isWindows

local prisma_lsp_command = isWindows() and "prisma-language-server.cmd" or "prisma-language-server"

require'lspconfig/configs'.prisma_ls = {
    default_config = {
        cmd = {prisma_lsp_command, "--stdio"},
        filetypes = {"prisma"},
        root_dir = function(fname)
            return require'lspconfig'.util.find_git_ancestor(fname) or vim.loop.os_homedir()
        end,
        settings = {prisma = {prismaFmtBinPath = ""}}
    }
}
