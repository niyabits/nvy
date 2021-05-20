local utils = require('lsp/utils')
local common_on_attach = utils.common_on_attach

local M = {}

function M.tsserver_on_attach(client, bufnr)
    common_on_attach(client, bufnr)

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    -- Disable TSServer Formatting
    client.resolved_capabilities.document_formatting = false

	  local ts_utils = require("nvim-lsp-ts-utils")

	  -- defaults
	  ts_utils.setup {
		  debug = false,
		  disable_commands = false,
		  enable_import_on_completion = true,
		  import_on_completion_timeout = 5000,

		  -- eslint
		  eslint_enable_code_actions = true,
		  eslint_bin = "eslint_d",
		  eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
		  eslint_enable_disable_comments = true,

		  -- parentheses completion
		  signature_help_in_parens = true,

		  -- update imports on file move
		  update_imports_on_move = false,
		  require_confirmation_on_move = false,
		  watch_dir = "/src",
	  }

	  -- required to enable ESLint code actions and formatting
	  ts_utils.setup_client(client)

	  -- no default maps, so you may want to define some here
	  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
	  vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
	  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
	  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
end

return M

