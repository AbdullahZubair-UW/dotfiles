local M = {
  "sekke276/dark_flat.nvim",
  event = false,
}

function M.config()
require("dark_flat").setup({
    transparent = false,
    colors = {},
    themes = function(colors)
        return {}
    end,
    italics = true,
})
end

return M
