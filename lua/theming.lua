vim.cmd('set termguicolors')
vim.cmd('syntax enable')
vim.g.tokyonight_style = "night"
vim.g.material_style = "deep ocean" -- deep ocean, oceanic 
vim.o.guifont = "FiraCode NF:h15"
vim.g.material_italic_keywords = true

require('material').set()

-- Switch To Lighter Theme with :Lighter
vim.cmd(":command LightTheme lua require('material.functions').change_style('lighter')<CR>")
