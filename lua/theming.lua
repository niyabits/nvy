vim.cmd('set termguicolors')
vim.cmd('syntax enable')
vim.o.guifont = "FiraCode NF:h15"

--[[
vim.g.tokyonight_style = "night"
-im.g.material_style = "deep ocean" -- deep ocean, oceanic
vim.g.material_italic_keywords = false
vim.g.material_borders = true
vim.g.material_contrast = true
vim.g.material_hide_eob = true
vim.g.material_custom_colors = {contrast = "#0f111a"}
require('material').set()
]]

vim.g.calvera_italic_keywords = false
vim.g.calvera_borders = true
vim.g.calvera_contrast = true
vim.g.calvera_hide_eob = true
vim.g.calvera_custom_colors = {contrast = "#0f111a"}

require('calvera').set()

-- Transparent BG
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
