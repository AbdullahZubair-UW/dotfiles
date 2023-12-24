local M = {
	"daschw/leaf.nvim",
  event = false,
}

function M.config()
require("leaf").setup({
    underlineStyle = "undercurl",
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    transparent = false,
    colors = {},
    overrides = {},
    theme = "dark", -- default, based on vim.o.background, alternatives: "light", "dark"
    contrast = "high", -- default, alternatives: "medium", "high"
})
end

return M

