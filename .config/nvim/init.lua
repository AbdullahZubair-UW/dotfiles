require "options"
require "keymaps"
require "Lazy"
require "autocommands"
require "user.darkplus"
require "user.monokai"
require "user.solarized"
require "user.leaf"


vim.cmd([[colorscheme leaf]])
require("telescope").load_extension "file_browser"


