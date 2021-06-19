local filePath = vim.fn.stdpath('config') .. '/settings.json'
local file = io.open(filePath, "rb")

if file == nil then
	error("settings.json could not be found")
end

local jsonString = file:read "*a"
file:close()

settingsTable = vim.fn.json_decode(jsonString)
print(settingsTable["footer"])

return settingsTable
