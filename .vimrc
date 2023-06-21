" syntax on
filetype plugin on
filetype indent on


set textwidth=165
set number
set nowrap
set shiftwidth=2
set tabstop=1
" set breakindent

set nobackup 
set nowritebackup
set noswapfile
set encoding=UTF-8
set path=+**
set wildmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
let maplocalleader = "."

""keybindings 
inoremap {<CR>  {<CR>}<Esc>O
imap jk    <Esc>
inoremap {}     {}
set belloff=all
nnoremap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

imap <C-l> <Plug>IMAP_JumpForward
nmap <C-l> <Plug>IMAP_JumpForward

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
call vundle#end()            
filetype plugin indent on   

call plug#begin()
  Plug 'flazz/vim-colorschemes'
  Plug 'tpope/vim-commentary'
  " Plug 'lervag/vimtex'
 	Plug 'ryanoasis/vim-devicons'
  Plug 'tomasiser/vim-code-dark'
		Plug 'dracula/vim', { 'as': 'dracula' }
		Plug 'vim-latex/vim-latex'
		Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_quickfix_autoclose_after_keystrokes=1
let g:vimtex_quickfix_open_on_warning=0


"SpellCheck Stuff
hi clear SpellBad
hi SpellBad cterm=underline
setlocal spell
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" Set style for gVim
hi SpellBad gui=undercurl

" Asymptote function
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
imap <C-w> <esc>:w<CR>:Silent asy %<CR>

" Theme settings
set termguicolors
set background=dark
set t_Co=256
colorscheme gruvbox8_hard


