
"TODO i think it might be time to switch packages
try
  " Always use \dots
  call IMAP('...', '\dots', 'tex')

  " Disable sections
  call IMAP('SPA', 'SPA', 'tex')
  call IMAP('SCH', 'SCH', 'tex')
  call IMAP('SSS', 'SSS', 'tex')
  call IMAP('SS2', 'SS2', 'tex')
  call IMAP('SPG', 'SPG', 'tex')
  call IMAP('SSP', 'SSP', 'tex')

  " Enumeration environments
	call IMAP('SSE', '\section*{<++>}<++>', 'tex')
  call IMAP('ENUM', "\\begin{enumerate}\<CR>\\item <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('alenum', "\\begin{enumerate}[label=(\alph*)]\<CR>\\item <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('ANUM', "\\begin{enumerate}[label=(\alph*), leftmargin=*,align=left] \<CR>\\item <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('itemize ', "\\begin{itemize}\<CR>\\ii <++>\<CR>\\end{itemize}<++>\<ESC>k<<",'tex')
  call IMAP('enuma ', "\\begin{enumerate}[<++>]\<CR>\\ii <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('.desc ', "\\begin{description}\<CR>\\ii[<++>] <++>\<CR>\\end{description}<++>\<ESC>k<<",'tex')

  "Other environments
  call IMAP('.fasy ', "\\begin{figure}[ht]\<CR>\\centering\<CR>\\begin{asy}\<CR><++>\<CR>\\end{asy}\<CR>\\caption{<++>}\<CR>\\end{figure}<++>", 'tex')
  call IMAP('.asy ', "\\begin{asy}\<CR><++>\<CR>\\end{asy}<++>", 'tex')
  call IMAP('.casy ', "\\begin{center}\<CR>\\begin{asy}\<CR><++>\<CR>\\end{asy}\<CR>\\end{center}<++>\<ESC>k<<k<<k<<", 'tex')
  call IMAP('.ftk ', "\\begin{center}\<CR>\\begin{tikzpicture}[scale=<++>]\<CR>\\SetVertex<++>\<CR><++>\<CR>\\end{tikzpicture}\<CR>\\end{center}<++>", 'tex')
  call IMAP('.block ', "\\begin{block}{<++>}\<CR><++>\<CR>\\end{block}<++>", 'tex')
  call IMAP('.ablock ', "\\begin{alertblock}{<++>}\<CR><++>\<CR>\\end{alertblock}<++>", 'tex')
  call IMAP('.eblock ', "\\begin{exampleblock}{<++>}\<CR><++>\<CR>\\end{exampleblock}<++>", 'tex')
  call IMAP('.center ', "\\begin{center}\<CR><++>\<CR>\\end{center}<++>", 'tex')
  call IMAP('.frame ', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}", 'tex')
  call IMAP('.align ', "\\begin{align*}\<CR><++>\<CR>\\end{align*}<++>", 'tex')
  call IMAP('.box ', "\\begin{mdframed}\<CR><++>\<CR>\\end{mdframed}<++>", 'tex')
  call IMAP('.diag ', "\\begin{diagram}\<CR><++>\<CR>\\end{diagram}<++>", 'tex')
  call IMAP('.cd ', "\\begin{center}\<CR>\\begin{tikzcd}\<CR><++>\<CR>\\end{tikzcd}\<CR>\\end{center}<++>\<ESC>k<<k<<k<<", 'tex')
  call IMAP('.cases ', "\\begin{cases}\<CR><++>\<CR>\\end{cases}<++>", 'tex')
  call IMAP('.fig ', "\\begin{figure}[ht]\<CR>\\centering\<CR>\\includegraphics[<++>]{<++>}\<CR>\\caption{<++>}\<CR>\\end{figure}\<CR><++>", 'tex')
  call IMAP('.wfig ', "\\begin{wrapfigure}[<++>]{r}{<++>}\<CR>\\centering\<CR>\\includegraphics[<++>]{<++>}\<CR>\\caption{<++>}\<CR>\\label{fig:<++>}\<CR>\\end{wrapfigure}\<CR><++>", 'tex')
  call IMAP('.img ', "\\begin{center}\<CR>\\includegraphics[<++>]{<++>}\<CR>\\end{center}\<CR><++>", 'tex')
  call IMAP('.code ', "\\begin{lstlisting}\<CR><++>\<CR>\\end{lstlisting}\<CR><++>\<ESC>k<<", 'tex')
  call IMAP('.mat ', "\\begin{bmatrix}\<CR><++>\<CR>\\end{bmatrix}<++>", 'tex')
  call IMAP('.beg ', "\\begin{<++>}\<CR><++>\<CR>\\end{<++>}<++>", 'tex') " BEST IDEA EVER

  "Miscellaneous maps
  call IMAP('<C-f>', '\frac{<++>}{<++>}<++>', 'tex')
  call IMAP('[]', '[]', 'tex')
  call IMAP('<<', '\left< <++>\right><++>', 'tex')
  call IMAP('||', '\left\lvert <++> \right\rvert<++>', 'tex')
  call IMAP('.floor ', '\left\lfloor <++> \right\rfloor<++>', 'tex')
  call IMAP('.ceil ', '\left\lceil <++> \right\rceil<++>', 'tex')
  call IMAP('.cycsum ', '\sum_{\text{cyc}} ', 'tex')
  call IMAP('.symsum ', '\sum_{\text{sym}} ', 'tex')
  call IMAP('.cycprod ', '\prod_{\text{cyc}} ', 'tex')
  call IMAP('.symprod ', '\prod_{\text{sym}} ', 'tex')
	call IMAP('bf', '\textbf{<++>}<++>', 'tex')
	call IMAP('set', "\\{<++>\\}<++>", 'tex')
	call IMAP('mk', "\\(<++>\\)<++>", 'tex')
  call IMAP('dm', "\\[\<CR><++>\<CR>.\\]<++>", 'tex')
	call IMAP('CHOOSE', "\binom{<++>}{<++>}<++>", 'tex')
	call IMAP('dt', "^{<++>}<++>", 'tex')
	call IMAP('sqr', "\\sqrt{<++>}<++>", 'tex')
	call IMAP('SQ', "\\sqrt[<++>]{<++>}<++>", 'tex')
	call IMAP('sr', "^2", 'tex')
	call IMAP('**', "\\cdot ", 'tex')

  " amsthm environments defined in evan.sty
  " Deferred to end because they're LONG.
  call IMAP('soln', "\\begin{proof}[Solution]\<CR><++>\<CR>\\end{proof}<++>", 'tex')
endtry


" latex synctex
nmap <silent> <localleader>s :call SyncTexForward()
" latex remove all double dollar signs
nnoremap <silent> <localleader>f :%s/\$\$/\\\[/<CR>:%s/\$\$/\\\]/<CR>

" TeX Customizations
let g:Tex_FoldedEnvironments='titlepage,abstract,asy,tikzpicture' " Folding of certain environments
let g:Tex_Leader='`'
set iskeyword+=: " Autocomplete for fig: etc. references
set iskeyword+=_ " Add _ to autocomplete list

" Wrap in dollar signs
nnoremap <localleader>w i$<Esc>ea$<Esc>

set conceallevel=2

" Leader keys that are defined for me
" <Leader>ll -> pdflatex compile
" <Leader>lv -> latex viewer
" <Leader>rf -> refresh folds (LaTeX)
