execute pathogen#infect()

colorscheme industry 
syntax on


let mapleader=","
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




noremap! <F1> <Esc>
inoremap <leader><leader> <Esc>/<++><Enter>4xi
vnoremap <leader><leader> <Esc>/<++><Enter>
map <leader><leader> <Esc>/<++><Enter>




filetype plugin indent on



autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd FileType python inoremap ,if if<space><++><space>:<cr><tab><++>
autocmd FileType python inoremap ,for for<space><++><space>in<space><++>:<cr><tab><++>
autocmd FileType python inoremap ,def def<space><++>(<++>):<cr><tab><++>
autocmd FileType python inoremap ,else else:<cr><tab>
autocmd FileType python inoremap ,elif elif<space><++><space>:<cr><tab><++>

