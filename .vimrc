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
set ai
set si
set enc=utf-8




noremap! <F1> <Esc>
inoremap <leader><leader> <Esc>/<++><Enter>4xi
vnoremap <leader><leader> <Esc>/<++><Enter>
map <leader><leader> <Esc>/<++><Enter>




filetype plugin indent on


autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd FileType python inoremap ,if if<space><++><space>:<cr><++>
autocmd FileType python inoremap ,for for<space><++><space>in<space><++>:<cr><++>
autocmd FileType python inoremap ,def def<space><++>(<++>):<cr><++>
autocmd FileType python inoremap ,else else:<cr>
autocmd FileType python inoremap ,elif elif<space><++><space>:<cr><++>
inoremap ,( (<space><++><space>)<Esc>T<hi
inoremap ,[ [<space><++><space>]<Esc>T<hi
inoremap ,{ {<space><++><space>}<Esc>T<hi
inoremap ,++ <++>

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
noremap <bs> <nop>
noremap <del> <nop>
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

" folding 
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Add omnicompletion
set omnifunc=syntaxcomplete#Complete

"Disable Enter
inoremap <Enter> <nop>
nnoremap <Enter> <nop>

" Word Count: Credits to the Internet!
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
                                                                                      
