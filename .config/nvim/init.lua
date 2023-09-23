require "options"
require "keymaps"
require "Lazy"
require "autocommands"
require "user.darkplus"
require "user.solarized"


vim.cmd([[colorscheme solarized]])
require("telescope").load_extension "file_browser"


