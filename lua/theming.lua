vim.cmd('set termguicolors')
vim.cmd('syntax enable')
Hamari Adhuri Kahani
vim.g.tokyonight_style = "night"
vim.g.material_style = "deep ocean"
vim.o.guifont = "FiraCode NF:h15"
vim.g.material_italic_keywords = true

require('material').set()

-- Switch To Lighter Theme with :Lighter
vim.cmd(":command LightMaterial lua require('material.functions').change_style('lighter')<CR>")

return M
