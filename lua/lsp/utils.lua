local M = {}

function M.common_on_attach(client, bufnr)
	-- Borders
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "single" }
	)

	-- Keymaps
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	function bufnnoremap(lhs, rhs)
		vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, opts)
	end

	bufnnoremap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
	bufnnoremap("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
	bufnnoremap("gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
	bufnnoremap("gr", "<cmd>Telescope lsp_references<CR>")
	bufnnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	bufnnoremap("K", '<Cmd>lua vim.lsp.buf.hover({ border = "single" })<CR>')
	bufnnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

	bufnnoremap("ge", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>')
	bufnnoremap("[e", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>')
	bufnnoremap("]e", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>')

	bufnnoremap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	bufnnoremap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	bufnnoremap("<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

	-- bufnnoremap("<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
	-- bufnnoremap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	-- bufnnoremap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	-- bufnnoremap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

return M
