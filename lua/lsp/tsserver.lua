local utils = require('lsp/utils')
local common_on_attach = utils.common_on_attach

local M = {}

function M.tsserver_on_attach(client, bufnr) 
    common_on_attach(client, bufnr)

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    -- Disable TSServer Formatting
    client.resolved_capabilities.document_formatting = false
end

return M

