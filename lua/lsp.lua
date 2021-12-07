-- LSP settings
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	function Bufmap(lhs, rhs)
		vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
	end
  -- stylua: ignore start
	Bufmap("gD"         , "<cmd>lua vim.lsp.buf.declaration()<CR>")
	Bufmap("gd"         , "<cmd>lua vim.lsp.buf.definition()<CR>")
	Bufmap("K"          , "<cmd>lua vim.lsp.buf.hover()<CR>")
	Bufmap("gi"         , "<cmd>lua vim.lsp.buf.implementation()<CR>")
	Bufmap("<C-k>"      , "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	Bufmap("<leader>wa" , "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	Bufmap("<leader>wr" , "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	Bufmap("<leader>wl" , "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	Bufmap("<leader>D"  , "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	Bufmap("<leader>rn" , "<cmd>lua vim.lsp.buf.rename()<CR>")
	Bufmap("gr"         , "<cmd>lua vim.lsp.buf.references()<CR>")
	Bufmap("<leader>ca" , "<cmd>lua vim.lsp.buf.code_action()<CR>")
	Bufmap("<leader>e"  , "<cmd>lua vim.diagnostic.open_float()<CR>")
	Bufmap("[d"         , "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	Bufmap("]d"         , "<cmd>lua vim.diagnostic.goto_next()<CR>")
	Bufmap("<leader>q"  , "<cmd>lua vim.diagnostic.setloclist()<CR>")
	Bufmap("<leader>so" , [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])

  -- TypeScript
	Bufmap("gs"         , "<cmd>TSLspOrganize<CR>")
	Bufmap("gr"         , "<cmd>TSLspRenameFile<CR>")
	Bufmap("gi"         , "<cmd>TSLspImportAll<CR>")
	-- stylua: ignore end

	-- TypeScript
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end
	client.resolved_capabilities.document_formatting = false

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
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server.name == "tsserver" then
		--		    opts.root_dir = function() ... end
	end

	server:setup(opts)
end)
