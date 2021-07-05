local settings = require("settings")
local utils = require('lsp/utils')
local common_on_attach = utils.common_on_attach

require'lspconfig'.tsserver.setup{
  on_attach =  function(client)
	common_on_attach(client, bufnr)

	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	-- Disable TSServer Formatting
	client.resolved_capabilities.document_formatting = false

	-- Null-ls for Prettier and ESLint
	require("null-ls").setup {}

	local ts_utils = require("nvim-lsp-ts-utils")

	-- defaults
	ts_utils.setup {
		debug = false,
		disable_commands = false,
		enable_import_on_completion = false,
		import_all_timeout = 5000, -- ms

		-- eslint
		eslint_enable_code_actions = true,
		eslint_enable_disable_comments = true,
		eslint_bin = "eslint_d",
		eslint_config_fallback = nil,
		eslint_enable_diagnostics = true,

		-- formatting
		enable_formatting = true,
		formatter = "prettierd",
		formatter_config_fallback = nil,

		-- parentheses completion
		complete_parens = false,
		signature_help_in_parens = true,

		-- update imports on file move
		update_imports_on_move = true,
		require_confirmation_on_move = true,
		watch_dir = nil,
	}

	-- required to fix code action ranges
	ts_utils.setup_client(client)
  end,

  handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = settings["virtualText"],
			underline = true,
		}),

		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		}),
	}
}

