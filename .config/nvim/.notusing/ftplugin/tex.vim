
"TODO i think it might be time to switch packages
try
  " Always use \dots
  call IMAP('...', '\dots', 'tex')
  call IMAP('`p', '\varphi', 'tex')

  " Disable sections
		"
  call IMAP('SPA', 'SPA', 'tex')
  call IMAP('SCH', 'SCH', 'tex')
  call IMAP('SSS', 'SSS', 'tex')
  call IMAP('SS2', 'SS2', 'tex')
  call IMAP('SSE', 'SSE', 'tex')
  call IMAP('SPG', 'SPG', 'tex')
  call IMAP('SSP', 'SSP', 'tex')

  " Enumeration environments
	call IMAP('.SSE', '\section*{<++>}<++>', 'tex')
  call IMAP('ENUM', "\\begin{enumerate}\<CR>\\item <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('alenum', "\\begin{enumerate}[label=(\\alph*)]\<CR>\\item <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('ANUM', "\\begin{enumerate}[label=(\\alph*), leftmargin=*,align=left] \<CR>\\item <++>\<CR>\\end{enumerate}<++>\<ESC>k<<",'tex')
  call IMAP('itemize ', "\\begin{itemize}\<CR>\\ii <++>\<CR>\\end{itemize}<++>\<ESC>k<<",'tex')

  "Other environments
  call IMAP('.fasy ', "\\begin{figure}[ht]\<CR>\\centering\<CR>\\begin{asy}\<CR><++>\<CR>\\end{asy}\<CR>\\caption{<++>}\<CR>\\end{figure}<++>", 'tex')
  call IMAP('.asy ', "\\begin{asy}\<CR><++>\<CR>\\end{asy}<++>", 'tex')
  call IMAP('.casy ', "\\begin{center}\<CR>\\begin{asy}\<CR><++>\<CR>\\end{asy}\<CR>\\end{center}<++>\<ESC>k<<k<<k<<", 'tex')
  call IMAP('.block ', "\\begin{block}{<++>}\<CR><++>\<CR>\\end{block}<++>", 'tex')
  call IMAP('.center ', "\\begin{center}\<CR><++>\<CR>\\end{center}<++>", 'tex')
  call IMAP('.frame ', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}", 'tex')
  call IMAP('.ali ', "\\begin{align*}\<CR><++>\<CR>\\end{align*}<++>", 'tex')
  call IMAP('.box ', "\\begin{mdframed}\<CR><++>\<CR>\\end{mdframed}<++>", 'tex')
  call IMAP('.diag ', "\\begin{diagram}\<CR><++>\<CR>\\end{diagram}<++>", 'tex')
  call IMAP('.cd ', "\\begin{center}\<CR>\\begin{tikzcd}\<CR><++>\<CR>\\end{tikzcd}\<CR>\\end{center}<++>\<ESC>k<<k<<k<<", 'tex')
  call IMAP('.cases ', "\\begin{cases}\<CR><++>\<CR>\\end{cases}<++>", 'tex')
  call IMAP('.fig ', "\\begin{figure}[ht]\<CR>\\centering\<CR>\\includegraphics[<++>]{<++>}\<CR>\\caption{<++>}\<CR>\\end{figure}\<CR><++>", 'tex')
  call IMAP('.wfig ', "\\begin{wrapfigure}[<++>]{r}{<++>}\<CR>\\centering\<CR>\\includegraphics[<++>]{<++>}\<CR>\\caption{<++>}\<CR>\\label{fig:<++>}\<CR>\\end{wrapfigure}\<CR><++>", 'tex')
  call IMAP('.img ', "\\begin{center}\<CR>\\includegraphics[<++>]{<++>}\<CR>\\end{center}\<CR><++>", 'tex')
  call IMAP('.code ', "\\begin{lstlisting}\<CR><++>\<CR>\\end{lstlisting}\<CR><++>\<ESC>k<<", 'tex')
  call IMAP('.mat ', "\\begin{pmatrix}\<CR><++>\<CR>\\end{pmatrix}<++>", 'tex')
  call IMAP('.beg ', "\\begin{<++>}\<CR><++>\<CR>\\end{<++>}<++>", 'tex') " BEST IDEA EVER

  "Miscellaneous maps
  call IMAP('<C-/>', '\frac{<++>}{<++>}<++>', 'tex')
  call IMAP('<<', '\left< <++>\right><++>', 'tex')
  call IMAP('||', '\left\lvert <++> \right\rvert<++>', 'tex')
  call IMAP('.floor ', '\left\lfloor <++> \right\rfloor<++>', 'tex')
  call IMAP('.ceil ', '\left\lceil <++> \right\rceil<++>', 'tex')
  call IMAP('.int ', '\int_{<++>}<++> \\, d <++>', 'tex')
  call IMAP('.iint ', '\iint_{<++>}<++> \\, d <++>', 'tex')
  call IMAP('.iter ', '\int_{<++>}<++>\int_{<++>} <++> \,d <++> \, d <++>', 'tex')
  call IMAP('.sum ', '\sum_{<++>}<++>', 'tex')
  call IMAP('.prod ', '\prod_{<++>}<++>', 'tex')
  call IMAP('.partial ', '\pdv{<++>}{<++>}<++>', 'tex')
  call IMAP('.restr', '\restr{<++>}{<++>}<++>', 'tex')
	call IMAP('.bf', '\textbf{<++>}<++>', 'tex')
	call IMAP('.tit', '\textit{<++>}<++>', 'tex')
	call IMAP('.tt', '\text{<++>}<++>', 'tex')
	call IMAP('.set', "\\{<++>\\}<++>", 'tex')
	call IMAP('mk', "$<++>$<++>", 'tex')
  call IMAP('dm', "\\[\<CR><++>\<CR>.\\]<++>", 'tex')
	call IMAP('.choose', "\binom{<++>}{<++>}<++>", 'tex')
	call IMAP('dt', "^{<++>}<++>", 'tex')
	call IMAP('.invs', "^{-1}", 'tex')
	call IMAP('.sq', "\\sqrt{<++>}<++>", 'tex')
	call IMAP('.[sq', "\\sqrt[<++>]{<++>}<++>", 'tex')
	call IMAP('sr', "^2", 'tex')
	call IMAP('cc', "\\subseteq", 'tex')
  call IMAP('.bar', "\\overline{<++>}<++>", 'tex')
	call IMAP('**', "\\cdot ", 'tex')

  " Deferred to end because they're LONG.
  call IMAP('soln', "\\begin{proof}[Solution]\<CR><++>\<CR>\\end{proof}<++>", 'tex')
  call IMAP('DEFN', "\\begin{defn}\<CR><++>\<CR>\\end{defn}<++>", 'tex')
  call IMAP('EX', "\\begin{ex}\<CR><++>\<CR>\\end{ex}<++>", 'tex')
  call IMAP('LEM', "\\begin{lem}\<CR><++>\<CR>\\end{lem}<++>", 'tex')
  call IMAP('thrm', "\\begin{thrm}\<CR><++>\<CR>\\end{thrm}<++>", 'tex')
endtry

function EvanCompileLaTeX(continuous)
  " von compiler
  if stridx(expand('%:p'), 'vondb') != -1 || stridx(expand('%:t'), 'von.tex') != -1
    lcd /tmp/preview_$USER
    if a:continuous
      silent !alacritty -T "latexmk" -e "latexmk -pvc -f von_preview.tex" &
    else
      silent !alacritty -T "latexmk" -e "latexmk -pv -f von_preview.tex" &
    endif
    return
  endif
  " search for documentclass
  let n = 1
  while n < 10 && n <= line('$')
    if getline(n) =~# 'documentclass'
      " compile and fire if found
      if a:continuous
        silent !alacritty -e latexmk -cd -pvc -f % &
      else
        silent !alacritty -e latexmk -cd -pv -f % &
      endif
      return
    endif
    let n = n + 1
  endwhile
  echo 'No documentclass provided. This file will not compile!'
endfunction

" latex compile continuously
nnoremap <silent> <localleader>p :call EvanCompileLaTeX(1)<CR>
" latex compile once
nnoremap <silent> <localleader>c :call EvanCompileLaTeX(0)<CR>

" latex synctex
nmap <silent> <localleader>s :call SyncTexForward()
" latex remove all double dollar signs
nnoremap <silent> <localleader>f :%s/\$\$/\\\[/<CR>:%s/\$\$/\\\]/<CR>

" TeX Customizations
let g:Tex_FoldedEnvironments='titlepage,abstract,asy,tikzpicture' " Folding of certain environments
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Tex_CompileRule_pdf='latexmk -cd -pvc -f'
let g:Tex_Leader='/'
let g:Tex_PackagesMenu=0
let g:Tex_ViewRule_pdf='zathura'
set iskeyword+=: " Autocomplete for fig: etc. references
set iskeyword+=_ " Add _ to autocomplete list

" Wrap in dollar signs
nnoremap <localleader>w i$<Esc>ea$<Esc>

