execute pathogen#infect()

syntax on


let mapleader=","
highlight tolong ctermbg=darkred ctermfg=white
match tolong /\%>80v.\+/
set showcmd
set nocompatible
set relativenumber
set number
set history=800
set autoread
set hlsearch
set showmatch
set expandtab
set autoindent
set si
set enc=utf-8

set backspace=0


noremap! <F1> <nop>

nnoremap  <Left> <nop>
nnoremap  <Right> <nop>
nnoremap  <Up> <nop>
nnoremap  <Down> <nop>
nnoremap  <PageUp> <nop>
nnoremap  <PageDown> <nop>

inoremap  <Left> <nop>
inoremap  <Right> <nop>
inoremap  <Up> <nop>
inoremap  <Down> <nop>
inoremap  <PageUp> <nop>
inoremap  <PageDown> <nop>

vnoremap  <Left> <nop>
vnoremap  <Right> <nop>
vnoremap  <Up> <nop>
vnoremap  <Down> <nop>
vnoremap  <PageUp> <nop>
vnoremap  <PageDown> <nop>



vnoremap  h <nop>
vnoremap  j <nop>
vnoremap  k <nop>
vnoremap  l <nop>
vnoremap  - <nop>
vnoremap  + <nop>

vnoremap  gj <nop>
vnoremap  gk <nop>
nnoremap  gk <nop>
nnoremap  gj <nop>

nnoremap  h <nop>
nnoremap  j <nop>
nnoremap  k <nop>
nnoremap  l <nop>
nnoremap  - <nop>
nnoremap  + <nop>




inoremap <leader><leader> <Esc>/<++><Enter>4xi
vnoremap <leader><leader> <Esc>/<++><Enter>
map <leader><leader> <Esc>/<++><Enter>





"Makes the just written Wort uppercase
inoremap <c-u> <esc>bveUea
"execs the vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"edits the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"correct teh verry annoying spelling mistake
iabbrev teh the
"insert mail
iabbrev @@ wegwerfadresse2720@protonmail.com
" closed Double quotes 
inoremap <leader>q "" <++><esc>2F"a
" map esc to jk
inoremap jk <esc>
inoremap <esc> <nop>
" map bs to nop
inoremap <bs> <nop>
inoremap <del> <nop>
"map c-c to comment line
autocmd FileType python inoremap <c-c> <esc>0i#<esc>
"force the new mappings
"autocmd FileType python :iabbrev <buffer> if NOPE!!!!
"mapping is shit...

"move between splits
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-w> <nop>

" No Enter Keys!
nnoremap <Enter> <nop>
inoremap <Enter> <nop>
" folding 
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Omnicompletion
set omnifunc=syntaxcomplete#Complete


filetype plugin indent on

function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<C-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
endfunction
 
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%10.10{WordCount()}w\   " wordcount
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                  " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set noruler         "
set laststatus=2    " show statusline

