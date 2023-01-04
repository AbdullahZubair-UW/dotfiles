require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.illuminate"
require "user.indentline"
require "user.alpha"
require "user.lsp"
require "user.dap"
require "user.vimtex"
require "user.ultisnip"
require("cmp_dictionary").setup({
		dic = {
			["*"] = { "/usr/share/dict/words" },
			["lua"] = "path/to/lua.dic",
			["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
			filename = {
				["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
			},
			filepath = {
				["%.tmux.*%.conf"] = "path/to/tmux.dic"
			},
			spelllang = {
				en = "path/to/english.dic",
			},
		},
		-- The following are default values.
		exact = 2,
		first_case_insensitive = false,
		document = false,
		document_command = "wn %s -over",
		async = false,
		capacity = 5,
		debug = false,
	})
