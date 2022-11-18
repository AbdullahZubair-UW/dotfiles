syntax on
filetype plugin on
filetype indent on
set textwidth=115
" set nofoldenable
set number
set nowrap
set tabstop=1 softtabstop=1
" set nobackup
set breakindent
set smartindent
" set smartcase
" set incsearch
" set hidden
" set relativenumber
" set updatetime=250
" set shortmess+=c
" set noshowmode
" set hlsearch

set nobackup 
set nowritebackup
set noswapfile
set encoding=UTF-8
set path=+**
set wildmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

""keybindings 
inoremap {<CR>  {<CR>}<Esc>O
imap jk    <Esc>
imap <C-w> <esc>:w<CR>
inoremap {}     {}
set belloff=all
nnoremap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" vp doesn't replace paste buffer
function! RestoreRegister()
 let @" = s:restore_reg
 return ''
endfunction
function! s:Repl()
 let s:restore_reg = @"
 return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Loading Templates
nnoremap ,hwk :-1read ~/.vim/.hwk.tex<CR>7j18li
nnoremap ,cite :-1read ~/.vim/.cite.tex<CR>


set nocompatible
filetype off   
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()  
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plugin 'preservim/nerdtree'
call vundle#end()            
filetype plugin indent on   

call plug#begin()
  Plug 'flazz/vim-colorschemes'
  Plug 'lervag/vimtex'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-commentary'
		Plug 'ryanoasis/vim-devicons'
		Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

"Turn off Code folding
let g:vimtex_fold_enabled =0

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_quickfix_autoclose_after_keystrokes=1
let g:vimtex_quickfix_open_on_warning=0

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger ='<c-l>'
" list all snippets for current filetype
" let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"SpellCheck Stuff
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

setlocal spell
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

set termguicolors

set background=dark
" colorscheme solarized8_light

