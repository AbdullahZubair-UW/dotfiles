syntax on 
filetype plugin on
filetype indent on
set textwidth=115
set nofoldenable
set number 
set nowrap
set tabstop=2 softtabstop=2 
set nobackup 
set breakindent
set smartindent 
set smartcase 
set incsearch 
set hidden
set relativenumber
set updatetime=250
set shortmess+=c 
set noshowmode
set hlsearch

set nobackup 
set nowritebackup
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
let mapleader = "\<Space>"

autocmd FileType cpp nnoremap <F5> :python3 Q3.py<CR>
"File Finding
set path+=**
set wildmenu

"keybindings 
inoremap {<CR>  {<CR>}<Esc>O
imap jk    <Esc>
imap <C-w> <esc>:w<CR>
inoremap {}     {}
set belloff=all
nnoremap <Leader>w :w<CR>

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


"AutoCompile Latex Stuff
" autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

set nocompatible               " be improved, required
filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required
Plugin 'valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
call vundle#end()               " required
filetype plugin indent on       " required

call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'flazz/vim-colorschemes'
  Plug 'lervag/vimtex'
  Plug 'SirVer/ultisnips'
  Plug 'lifepillar/vim-solarized8'
  Plug 'tpope/vim-commentary'
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

" NERDTree """"""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTree<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


