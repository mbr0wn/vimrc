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

"""""" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_on_text_changed = 'never'
let g:ale_cpp_clangcheck_options = '-extra-arg=-std=c++14'
let g:ale_python_pylint_executable = 'pylint-3'


"""""" Airline """"""""""""""""""""""""""""""""
if has("gui_running") || $DISABLE_POWER_FONTS != "1"
	let g:airline_powerline_fonts = 1
end
let g:airline#extensions#tabline#enabled = 1

"""""" FZF """""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'

"""""" Color """""""""""""""""""""""""""""""""""
if exists("g:solarized_forceterm16")
    set background=light
elseif !has("gui_running")
    " If the terminal is not using a solarized palette, we need this setting:
    if ($KONSOLE_PROFILE_NAME == "Shell" || $SSH_CONNECTION) && ($KONSOLE_PROFILE_NAME != "Solarized")
        let g:solarized_termcolors=256
    endif
    set t_Co=256
endif
colorscheme solarized
set background=light

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

