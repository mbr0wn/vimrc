" Create PDF via DVI
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_ViewRule_dvi = 'evince'
let g:Tex_ViewRule_ps  = 'evince'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_Menus = 0

call IMAP('ESI', "\\SI{<++>}{<++>}<++>", 'tex')
call IMAP('EFM', "\\begin{frame}\<cr> \\frametitle{<++>}\<cr> \\begin{itemize}\<cr> \\item <++>\<cr> \\end{itemize}<++>\<cr> \\end{frame}\<cr>", 'tex')

set tabstop=2      " 4-space tab
set shiftwidth=2   " This allows you to use the < and > keys from VIM's visual  mode to block indent/unindent
set expandtab      " Insert spaces instead of <TAB> character when the <TAB> key is pressed.
set softtabstop=2  " makes VIM see multiple space characters as tabstops.

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
set iskeyword+=_

setlocal spell

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse latex-suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

