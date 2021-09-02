require("lualine").setup({
	options = { theme = "calvera-nvim" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				sections = { "error", "warn", "info" },
				symbols = { error = " ", warn = " ", info = " " },
			},
			{
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = "",
				color = { fg = "#ffffff", gui = "bold" },
				separator = "",
			},
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
