local M = { "uga-rosa/cmp-dictionary" }

function M.config()
  require("cmp_dictionary").setup {
		dic = {
			["tex"] = { "/usr/share/dict/words" },
			["lua"] = "path/to/lua.dic",
			["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
			spelllang = {"en_us"},
		},
		exact = 2,
		first_case_insensitive = false,
		document = false,
		document_command = "wn %s -over",
		async = false,
		capacity = 5,
		debug = false,
  }
end

return M
