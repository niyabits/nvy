-- Better Keymaps
local M = {}

-- :help map-modes
function M.map(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end

function M.noremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function M.exprnoremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = true })
end

-- stylua: ignore start
function M.nmap(lhs, rhs) M.map('n', lhs, rhs) end
function M.nnoremap(lhs, rhs) M.noremap('n', lhs, rhs) end
function M.vnoremap(lhs, rhs) M.noremap('v', lhs, rhs) end
function M.xnoremap(lhs, rhs) M.noremap('x', lhs, rhs) end
function M.inoremap(lhs, rhs) M.noremap('i', lhs, rhs) end
function M.tnoremap(lhs, rhs) M.noremap('t', lhs, rhs) end
function M.exprinoremap(lhs, rhs) M.exprnoremap('i', lhs, rhs) end
function M.exprnnoremap(lhs, rhs) M.exprnoremap('n', lhs, rhs) end
-- stylua: ignore end

return M
