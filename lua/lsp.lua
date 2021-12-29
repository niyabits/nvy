-- LSP settings
local common_on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	local function bufmap(lhs, rhs)
		vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
	end
  -- stylua: ignore start
	bufmap("gD"         , "<cmd>lua vim.lsp.buf.declaration()<CR>")
	bufmap("gd"         , "<cmd>lua vim.lsp.buf.definition()<CR>")
	bufmap("K"          , "<cmd>lua vim.lsp.buf.hover()<CR>")
	bufmap("gi"         , "<cmd>lua vim.lsp.buf.implementation()<CR>")
	bufmap("gr"         , "<cmd>lua vim.lsp.buf.references()<CR>")
	bufmap("[e"         , "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	bufmap("]e"         , "<cmd>lua vim.diagnostic.goto_next()<CR>")
	bufmap("<C-k>"      , "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	bufmap("<leader>wa" , "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	bufmap("<leader>wr" , "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	bufmap("<leader>wl" , "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	bufmap("<leader>D"  , "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	bufmap("<leader>rn" , "<cmd>lua vim.lsp.buf.rename()<CR>")
	bufmap("<leader>ca" , "<cmd>lua vim.lsp.buf.code_action()<CR>")
	-- bufmap("<leader>e"  , "<cmd>lua vim.diagnostic.open_float()<CR>")
	bufmap("<leader>q"  , "<cmd>lua vim.diagnostic.setloclist()<CR>")
	bufmap("<leader>so" , [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])

  -- TypeScript
	bufmap("gs"         , "<cmd>TSLspOrganize<CR>")
	bufmap("gr"         , "<cmd>TSLspRenameFile<CR>")
	bufmap("gi"         , "<cmd>TSLspImportAll<CR>")
	-- stylua: ignore end

	-- TypeScript
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end
	client.resolved_capabilities.document_formatting = false

	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")

	local ts_utils = require("nvim-lsp-ts-utils")

	ts_utils.setup({
		enable_import_on_completion = true,
	})

	ts_utils.setup_client(client)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {
		init_options = require("nvim-lsp-ts-utils").init_options,
		on_attach = common_on_attach,
		capabilities = capabilities,
	}

	server:setup(opts)
end)
