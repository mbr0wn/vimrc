""" VIM config file - MB
" vim:sw=4 et:
set nocompatible
let mapleader = ','

"""""" Visual settings """"""""""""""
" Colour needs to be set after pathogen, because it's a bundle
set termencoding=utf-8

if has("gui_running")
	set guifont=Liberation\ Mono\ for\ Powerline\ 14
    set go=
endif

"""""" Mini buffer explorer """""""""
let g:miniBufExplBRSplit = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMaxSize = 30
"let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplBuffersNeeded=2


"""""" Filetype-specific hacks """"""
" C++ options
autocmd BufEnter *.i  :set filetype=cpp " These are usually SWIG files for me

" Markdown, not Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"" Settings for latex suite.
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
:let g:tex_flavor="latex"

" Makefiles
autocmd BufEnter Makefile* :set filetype=make

"""""" CTags and tag list """"""""""""""""""""""
command MkTags :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .


"""""" OmniCppComplete """""""""""""""""""""""""
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2 " 2: included 1: this file only
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"""""" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_on_text_changed = 'never'
let g:ale_cpp_clangcheck_options = '-extra-arg=-std=c++14'
let g:ale_python_pylint_executable = 'pylint3'


"""""" Airline """"""""""""""""""""""""""""""""
if has("gui_running") || $DISABLE_POWER_FONTS != "1"
	let g:airline_powerline_fonts = 1
end
let g:airline#extensions#tabline#enabled = 1

"""""" FZF """""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'

"""""" Color """""""""""""""""""""""""""""""""""
if exists("g:solarized_forceterm16")
    set background=dark
elseif !has("gui_running")
    " If the terminal is not using a solarized palette, we need this setting:
    if ($KONSOLE_PROFILE_NAME == "Shell" || $SSH_CONNECTION) && ($KONSOLE_PROFILE_NAME != "Solarized")
        let g:solarized_termcolors=256
    endif
    set t_Co=256
endif
colorscheme solarized
set background=dark

" autohighlight leading/trailing whitespaces
highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

" autohighlight leading/trailing whitespaces
highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

"""""" Random features """"""""
set ignorecase smartcase
set foldmethod=syntax
set nofoldenable
set hidden

""" Jedi """""""""""""""""""""""""""""""""""""""
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0 " Disable popup with arguments

""" Easytags """""""""""""""""""""""""""""""""""
let g:easytags_async = 1

""" Ag """""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

" automatic folding
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" Make sure vim checks for 'set commands' in opened files
set modeline
set modelines=3

" Prefer to break at words
set linebreak

set clipboard=unnamedplus
""""""""""""""""""""""""""""

