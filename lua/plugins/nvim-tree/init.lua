local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
    ["l"] = tree_cb("edit"),
    ["h"] = tree_cb("close_node")
}

vim.g.nvim_tree_icons = {
	default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}

vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_gitignore = 1
