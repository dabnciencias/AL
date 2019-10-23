execute pathogen#infect()
syntax on
filetype plugin indent on

" Speed up scrolling
set ttyfast

" Show line numbers and change to green
set number
:highlight LineNr ctermfg=green

" Show UTF-8 characters
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8

" Update file constantly in live preview
autocmd FileType tex setl updatetime=1

" Mapping fj and jf to Esc
inoremap fj <Esc>
inoremap jf <Esc>

" Navigating with guides
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
map <Space><Space> <Esc>/<++><Enter>"_c4l

" LaTeX shortcuts:
"
" Beginning of document
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
" " General text
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,benum \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,bitem \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ni <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,lab \label{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,hl \hline
autocmd FileType tex inoremap ,hl \hline
autocmd FileType tex inoremap ,cen \centering
autocmd FileType tex inoremap ,hs \hspace{}<++><Esc>T{i
autocmd FileType tex inoremap ,vs \vspace{}<++><Esc>T{i
" \begin...
" NOTE: make a generic ",beg" one with double cursor
autocmd FileType tex inoremap ,btabu \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,btabl \begin{table}<Enter><++><Enter>\end{table}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,bfig \begin{figure}<Enter>\centering<Enter>\includegraphics{}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Esc>3keei
autocmd FileType tex inoremap ,btcol \begin{tcolorbox}<Enter><++><Enter>\end{tcolorbox}
" Document sections
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i

