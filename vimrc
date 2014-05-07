call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,fullscreen
endfunction 
"au GUIEnter * call Maximize_Window()
set guifont=Inconsolata\ 14
set nu
set hidden
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
noremap ' ,

" ,W will delete trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>p "+P
nnoremap <leader>M :%s/\r\(\n\)/\1/g<cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> <leader><leader> <c-^>
noremap <F5> :CommandTFlush<CR>

autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
" messes up eruby indentation
"autocmd FileType eruby unlet b:did_indent | runtime! indent/javascript.vim

hi Cursor guibg=#008B00
au InsertLeave * hi Cursor guibg=#008B00
au InsertEnter * hi Cursor guibg=#008B00
highlight iCursor guibg=#008B00
set guicursor+=i:ver30-iCursor

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 1
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif

