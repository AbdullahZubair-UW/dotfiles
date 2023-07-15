local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
}

-- vim.opt.list = true

M.opts = {
  char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = false, --CHANGE BACK
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
  },
}

return M
