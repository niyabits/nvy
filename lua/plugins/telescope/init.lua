local actions = require('telescope.actions')
local utils = require('telescope.utils')
local trouble = require("trouble.providers.telescope")

require('telescope').setup {
    defaults = {
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

	layout_config = {
        preview_cutoff = 70,
	},

    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg"
        }
    }
}

local M = {}

M.project_files = function()
    local _, ret, stderr = utils.get_os_command_output(
	   {'git', 'rev-parse', '--is-inside-work-tree'}
	  )
    local gopts = {}
    gopts.prompt_title = 'Git Files'
    gopts.prompt_prefix = '  '
    if ret == 0 then
        require'telescope.builtin'.git_files(gopts)
    else
        require'telescope.builtin'.find_files()
    end
end

M.nvim_config = function()
    require('telescope.builtin').find_files {
        prompt_title = "\\ Neovim Config /",
        cwd = vim.fn.stdpath('config'),
        shorten_path = false
    }
end

return M
