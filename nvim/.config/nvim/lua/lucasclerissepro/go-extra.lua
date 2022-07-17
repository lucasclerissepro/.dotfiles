-- I put any extra commands I use for Go development here.
-- At some point it will probably make sense to extract it into a plugin.

local Job = require("plenary.job")
local popup = require "plenary.popup"

local M = {}


-- A simple helper to add tags to a go struct
function M.add_go_tags(type)
    type = type or "json"

    local currentFile = vim.fn.expand('%')
    local currentStruct = vim.fn.expand("<cword>")

    local cmd = string.format(
        "!gomodifytags -file %s -struct %s -add-tags %s --quiet -w",
        currentFile,
        currentStruct,
        type
    )

    vim.cmd(cmd)
end

return M
