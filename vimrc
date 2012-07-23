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

vmap <C-c> "+y
vmap <C-x> "+c


:set list
" List chars
set listchars="" " Reset the listchars
set listchars+=tab:\ \ " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:. " show trailing spaces as dots
set listchars+=extends:> " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:< " The character to show in the last column when wrap is off and the line continues beyond the right of the screen

let mapleader=","

" ,W will delete trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>p "+P

autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

