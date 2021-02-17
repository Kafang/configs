"execute pathogen#infect()

syntax on

let mapleader=","
highlight tolong ctermbg=darkred ctermfg=white
match tolong '\%120v.'

set lazyredraw
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
nnoremap <bs> <nop>
nnoremap <del> <nop>

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

"Add omnicompletion
set omnifunc=syntaxcomplete#Complete

filetype plugin indent on

" Word Count: Credits to the Internet! 
" It needs to check for empty buffer!!
function! WordCount()
        if line('$')==1 && getline(1) == ''
                return 0
        end

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

" Stuff for PGDP
function Autoformat()
        normal gg=G " Use Autoformat to format the whole File
        %s/\s\+$//e " Remove trailing Whitespace
        %s/\n\{3,}/\r\r/e "Remove multiple Blank lines

endfunction

function NewJavaClass()
        execute "normal!  0ipublic class " . expand('%:t:r') . "  {\<enter>\<enter>}\<esc>k"
        
        
endfunction
autocmd BufWritePre *.java call Autoformat()  "Autoformat on save
autocmd FileWritePost,BufWritePost *.java silent! execute "!javac %" | redraw! "Compile after save

autocmd BufNewFile *.java call  NewJavaClass()
autocmd FileType java set omnifunc=ale#completion#OmniFunc
autocmd FileType java inoremap " ""<left>
autocmd FileType java inoremap ( ()<left>
autocmd FileType java inoremap ) <ESC>f)a
autocmd FileType java inoremap [ []<left>
autocmd FileType java inoremap ] <ESC>f]a
autocmd FileType java inoremap { {}<left>
autocmd FileType java inoremap {<CR> {<CR>}<ESC>O
autocmd FileType java iabbrev retunr return
" in nm press gs to auto insert getters and setters after a block - > to
autocmd FileType java nnoremap gs $BB"tyEW"nye~b"uye~}opublic <C-R>t get<C-R>u(){<CR>return <C-R>n;<CR>}<CR>public void set<C-R>u(<C-R>t value){<CR>this.<C-R>n = value;<CR>}<ESC>3<C-O>j
" in nm press gc to auto insert  a constructor
autocmd FileType java nnoremap gc ma/class<CR>w"cye}opublic <C-R>c(){<enter><enter>}<esc>'a:nohlsearch<cr>
"autocmd FileType java nnoremap gm /class<CR>w"nyef{wVy}pV}:s/\<private\>\|\<public\>\|\<static\>\|\<final\>//g<CR>{V}:g/=/d{V}"ay{V}JV:s/;/,/g<CR>$x"py$ddopublic <C-R>n(<C-R>p){<enter><C-R>a<enter>} 

" Stuff for ERA
autocmd FileType asm set ft=nasm


"required for ALE linting integration
packloadall
silent! helptags all
