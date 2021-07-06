vim.cmd('set termguicolors')
vim.cmd('syntax enable')
vim.g.tokyonight_style = "night"
vim.g.material_style = "deep ocean" -- deep ocean, oceanic 
vim.o.guifont = "FiraCode NF:h15"
vim.g.material_italic_keywords = true
vim.g.material_borders = true
vim.g.material_contrast = true
vim.g.material_hide_eob = true
vim.g.material_custom_colors = {contrast = "#0f111a", float = "#0f111a"}

require('material').set()

