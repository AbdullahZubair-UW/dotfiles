local M = {
 "preservim/tagbar",
		event = "VeryLazy",
}

vim.cmd([[let g:tagbar_type_tex = {'ctagstype' : 'latex','kinds' : ['s:sections','g:graphics:0:0', 'l:labels','r:refs:1:0','p:pagerefs:1:0'],'sort': 0} ]])
vim.cmd([[let g:tagbar_width = 70]])
return M
