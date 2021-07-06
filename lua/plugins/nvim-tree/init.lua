local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
    {key = {"l", "<CR>", "<2-LeftMouse>"}, cb = tree_cb("edit")},
    {key = "h", cb = tree_cb("close_node")}
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = ""
    }
}

vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_special_files = {}
