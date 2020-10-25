if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=2
let g:tex_conceal='abdmg'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

call plug#end()

syntax on

" Speed up scrolling
set ttyfast

" Use the system clipboard for copy and paste
set clipboard=unnamedplus

" Show line numbers and change to green
set number
highlight LineNr ctermfg=green

" Show UTF-8 characters
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8

" Mapping jf and fj to Esc
inoremap fj <Esc>
inoremap jf <Esc>
inoremap fJ <Esc>
inoremap jF <Esc>
inoremap FJ <Esc>
inoremap JF <Esc>

" Navigating with guides
" inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
" vnoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
" map <Tab><Tab> <Esc>/<++><Enter>"_c4l

" TeX shortcuts:

" Beginning of document
autocmd FileType tex inoremap up<Tab> <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
"
"" General text
" autocmd FileType tex inoremap bf<Tab> \textbf{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap em<Tab> \emph{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap un<Tab> \underline{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap ov<Tab> \overline{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap fn<Tab> \footnote{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap lab<Tab> \label{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap cap<Tab> \caption{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap ref<Tab> \ref{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap url<Tab> \url{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap hl<Tab> <Esc>$o\hline<Enter>
" autocmd FileType tex inoremap cen<Tab> \centering<Enter>
" autocmd FileType tex inoremap hs<Tab> \hspace{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap vs<Tab> \vspace{}<Space><++><Esc>T{i
" autocmd FileType tex inoremap -<Tab> \textemdash<Space>
" autocmd FileType tex inoremap noin<Tab> \noindent<Space>
" autocmd FileType tex inoremap tw<Tab> \textwidth 
autocmd FileType tex inoremap def<Tab> \begin{tcolorbox}<Enter>\underline{Def.}<Space><Enter>\end{tcolorbox}<Esc>k$a
autocmd FileType tex inoremap not<Tab> \begin{tcolorbox}<Enter>\underline{Notación:}<Enter><Enter>\centering<Enter>\begin{tabular}{cc}<Enter>\\<Enter>$$<Space>&<Space><++><Space>\\<Space>\\<Enter>$<++>$<Space>&<Space><++><Space>\\<Enter>\end{tabular}<Enter>\end{tcolorbox}<Esc>3k2T$i
" autocmd FileType tex inoremap row<Tab> <Esc>$a<Enter>$$<Space>&<Space><++><Space>\\<Space>\\<Esc>2T$i

" Document sections
" autocmd FileType tex inoremap chap<Tab> \chapter{}<Enter><Enter><++><Esc>2kf}i
" autocmd FileType tex inoremap sec<Tab> \section{}<Enter><Enter><++><Esc>2kf}i
" autocmd FileType tex inoremap sub<Tab> \subsection{}<Enter><Enter><++><Esc>2kf}i
" autocmd FileType tex inoremap ssub<Tab> \subsubsection{}<Enter><Enter><++><Esc>2kf}i

" Math mode
" autocmd FileType tex inoremap $$ $$$$<Space><++><Esc>6hi
" autocmd FileType tex inoremap -> \rightarrow<Space>
" autocmd FileType tex inoremap <- \leftarrow<Space>
" autocmd FileType tex inoremap ddx<Tab> \frac{d}{dx}<Space><++><Esc>6h
" autocmd FileType tex inoremap idx<Tab> \int<Space><Space>d<++><Space><++><Esc>10hi
" autocmd FileType tex inoremap mbf<Tab> \mathbf{}<++><Esc>T{i
" autocmd FileType tex inoremap mbb<Tab> \mathbb{}<++><Esc>T{i
" autocmd FileType tex inoremap deg<Tab> ^\circ<Space>
" autocmd FileType tex inoremap proj<Tab> P_{\mathbf{}}(\mathbf{<++>})<Space><++><Esc>2T{i
" autocmd FileType tex inoremap scal<Tab> (,<++>)<++><Esc>T(i
" autocmd FileType tex inoremap norm<Tab> ||\mathbf{}||<++><Esc>T{i
" autocmd FileType tex inoremap sp<Tab> \langle<Space><Space>\rangle<Space><++><Esc>12hi
" autocmd FileType tex inoremap imp<Tab> \implies<Space>
" autocmd FileType tex inoremap for<Tab> \hspace{3mm}\forall\hspace{1.5mm}<Space> 
" autocmd FileType tex inoremap x<Tab> \times<Space>
" autocmd FileType tex inoremap .<Tab> \cdot<Space>
" autocmd FileType tex inoremap tex<Tab> \hspace{1.5mm}\text{}\hspace{1.5mm}<Space><++><Esc>2T{i
autocmd FileType tex inoremap teo<Tab> \begin{teorema}<Space><Enter><++><Enter><Enter>\begin{proof}<Enter><++><Enter>\end{proof}<Enter><++><Enter><Enter>\end{teorema}<Enter><Enter><++><Esc>4k04xk4xk8xk4x2k4xk$a
autocmd FileType tex inoremap cor<Tab> \begin{corolario}<Space><Enter><++><Enter><Enter>\begin{proof}<Enter><++><Enter>\end{proof}<Enter><++><Enter><Enter>\end{corolario}<Enter><Enter><++><Esc>4k04xk4xk8xk4x2k4xk$a

" This makes vim turn paste mode on/off automatically when you paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" Lastly, to get all UTF-8 characters to appear correctly in vim, make sure
" you have your locales defined as follows:

" sudo vim /etc/locale.gen
"   uncomment line "en_US.UTF-8 UTF-8" and save the file
" locale gen
" localectl set-locale LANG=en_US.UFT-8
"
" And you should be all set!
