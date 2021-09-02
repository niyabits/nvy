-- Jump forward or backward

function imap(lhs, rhs)
	vim.api.nvim_set_keymap("i", lhs, rhs, { expr = true })
end

function smap(lhs, rhs)
	vim.api.nvim_set_keymap("s", lhs, rhs, { expr = true })
end

vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets/"
