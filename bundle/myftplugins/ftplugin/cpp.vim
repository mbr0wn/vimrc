" Include standard tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/boost

set cindent
set tabstop=8
set shiftwidth=8
set softtabstop=8
set nowrap
set foldmethod=syntax
set number
set complete=.,w,b,u,t
set list
set listchars=tab:>-,nbsp:%

" Keymappings are in after/../cpp.vim, because otherwise, settings from c.vim
" override this.
