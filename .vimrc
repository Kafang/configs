execute pathogen#infect()


colorscheme industry 
syntax on


let mapleader=","
set showcmd
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


filetype plugin indent on



autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()


