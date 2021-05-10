local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")

require('telescope').setup{
  defaults = {
	preview_cutoff = 70,
	mappings = {
	  i = {
		  ["<C-j>"] = actions.move_selection_next,
		  ["<C-k>"] = actions.move_selection_previous,
		  ["<C-q>"] = actions.send_to_qflist,
		  ["<C-t>"] = trouble.open_with_trouble,

		  ["<CR>"] = actions.select_default + actions.center
	  },
	  n = {
		  ["<C-j>"] = actions.move_selection_next,
		  ["<C-k>"] = actions.move_selection_previous,
		  ["<C-t>"] = trouble.open_with_trouble
	  }
	}
  },

  extensions = {
	media_files = {
	  filetypes = {"png", "webp", "jpg", "jpeg"},
	  find_cmd = "rg"
	}
  }
}
