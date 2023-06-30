require "options"
require "keymaps"
require "Lazy"
require "autocommands"
require "user.monokai"


vim.cmd([[colorscheme monokai-pro]])
require("telescope").load_extension "file_browser"


