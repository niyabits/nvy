local null_ls = require("null-ls")

require("null-ls").setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d, -- eslint or eslint_d
		null_ls.builtins.code_actions.eslint_d, -- eslint or eslint_d
		null_ls.builtins.formatting.prettier, -- prettier, eslint, eslint_d, or prettierd
		null_ls.builtins.formatting.rustfmt, -- Rust
	},
})
