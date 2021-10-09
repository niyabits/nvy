local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
	lsp_diagnostics = true,
	hijack_cursor = true,
	view = {
		mappings = {
			list = {
				{ key = { "l", "<CR>", "<2-LeftMouse>" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
			},
		},
	},
	update_focused_file = {
		enable = true,
	},
})

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = " S",
		unmerged = "",
		renamed = "➜",
		untracked = " U",
		deleted = "",
		ignored = "",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_special_files = {}
