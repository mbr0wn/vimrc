""" VIM config file - MB
set nocompatible

"""""" Visual settings """"""""""""""
" automatic syntax highlighting
syntax enable

" Turn ruler on
set ruler

colorscheme delek
if has("gui_running")
	colorscheme desert
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
    set go=
end

set termencoding=utf-8
set encoding=utf-8

" autohighlight leading/trailing whitespaces
highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

"""""" Mini buffer explorer """""""""
let g:miniBufExplSplitBelow = 0
let g:miniBufExplModSelTarget = 1
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 20
let g:miniBufExplMaxSize = 30
"let g:miniBufExplForceSyntaxEnable = 1


"""""" Filetype-specific hacks """"""
filetype plugin indent on

" C options
autocmd BufEnter *.i  :set filetype=cpp " *.is usually SWIG files for me

"" Settings for latex suite.
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
:let g:tex_flavor="latex"

" Makefiles
autocmd BufEnter Makefile* :set filetype=make

"""""" CTags and tag list """"""""""""""""""""""
command MkTags :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .


"""""" OmniCppComplete """""""""""""""""""""""""
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

let g:syntastic_mode_map = { 'mode': 'active',
						   \ 'active_filetypes': [],
						   \ 'passive_filetypes': ['python'] }


"""""" Pathogen """"""""""""""""""""""""""""""""
call pathogen#infect()

"""""" Random features """"""""
set ignorecase smartcase
set foldmethod=syntax

source $VIMRUNTIME/macros/matchit.vim

" automatic folding
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" Make sure vim checks for 'set commands' in opened files
set modeline
set modelines=3

" Prefer to break at words
set linebreak
""""""""""""""""""""""""""""
