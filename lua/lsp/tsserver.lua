local nvim_lsp = require("lspconfig")
local utils = require("lsp/utils")
local common_on_attach = utils.common_on_attach

nvim_lsp.tsserver.setup({
	on_attach = function(client, bufnr)
		common_on_attach(client)

		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end

		-- disable tsserver formatting if you plan on formatting via null-ls
		client.resolved_capabilities.document_formatting = false

		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup({
			enable_import_on_completion = true,

			-- eslint
			eslint_enable_code_actions = true,
			eslint_bin = "eslint_d",
			eslint_enable_diagnostics = true,

			-- formatting
			enable_formatting = true,
			formatter = "prettier",

			-- update imports on file move
			update_imports_on_move = true,
		})

		-- required to fix code action ranges
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", opts)
		-- Map to leader
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", ":TSLspRenameFile<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
	end,
})
