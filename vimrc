autocmd!

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
"use 2 spaces when using autoindent/cindent
set shiftwidth=2
"use the same value as shiftwidth
set softtabstop=2
"use 2 char positions for a TAB
set tabstop=2

set autoindent
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set showmatch
set incsearch
set hlsearch

"use 4 char positions for js files
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
"autocmd FileType eruby setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Add line numbers
set nu

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
"set cursorline
set cmdheight=1
set switchbuf=useopen

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
"set re=1

function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,fullscreen
endfunction 

augroup vimrc_autocmd
autocmd!
"iterm does not requrie this
"autocmd VimLeave * :!open -a Terminal
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
autocmd FileType ruby map <leader>r :w<CR>:!ruby %<CR>
autocmd FileType ruby map <leader>s :w<CR>:!rspec %<CR>
autocmd FileType java map <F9> :w<CR> :compiler java
autocmd FileType js :setlocal sw=4 ts=4 sts=4
"au InsertLeave * hi Cursor guibg=#008B00
"au InsertEnter * hi Cursor guibg=#008B00
augroup END

"au GUIEnter * call Maximize_Window()
"set lines=999 columns=9999
"set guifont=Inconsolata:h16
"set guifont=Source\ Code\ Pro\ Light:h16
syntax on
filetype plugin on
filetype indent on
" set autoindent
set smartindent
set ic
" imap jj <Esc>

"set ttyfast
"colorscheme wombat
colorscheme wombat256
set ruler
set backspace=indent,eol,start
set noswapfile

"colorscheme codeschool

"
"let g:CommandTWildIgnore=&wildignore . ",**/node_modules/*"
"let g:CommandTFileScanner="watchman"
let g:CommandTFileScanner="watchman"
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
set wildignore+=node_modules

" center search results
set scrolloff=999

" don't make backup files
set nobackup
set nowritebackup

vmap <C-c> "*y
vmap <C-x> "*c

"if &diff
  "setup for diff mode
"else
  "setup for non-diff mode
"  set lines=999 columns=9999
"endif

set diffopt+=vertical

"zE unfold all
"set nofoldenable
:set hlsearch

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

map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>


" messes up eruby indentation
"autocmd FileType eruby unlet b:did_indent | runtime! indent/javascript.vim

hi Cursor guibg=#008B00
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
  let g:LargeFile = 512 * 1024 * 1
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%
map <leader>s :!rspec %<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

