
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
call plug#end()
