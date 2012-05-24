call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,fullscreen
endfunction 
"au GUIEnter * call Maximize_Window()
set guifont=Inconsolata\ 14
set nu
syntax on
filetype plugin on
filetype indent on
" set autoindent
set smartindent
set ic
" imap jj <Esc>
set expandtab
"Autoindentation
set autoindent
"use 2 spaces when using autoindent/cindent
set shiftwidth=2
"use the same value as shiftwidth
set softtabstop=2
"use 2 char positions for a TAB
set tabstop=2
"set ttyfast
colorscheme wombat
:vmap <C-C> "+y
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

