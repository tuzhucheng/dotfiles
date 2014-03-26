set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Pychimp/vim-luna'
Plugin 'tpope/vim-vividchalk'

" My bundles here:

filetype plugin indent on
syntax enable

set tabstop=4 " set the width of a tab to 4
set shiftwidth=4 " set the indent to width of 4
set softtabstop=4 " set the number of columns for a tab
set expandtab " expand tabs to spaces

set t_Co=256
set laststatus=2

set background=dark
colorscheme solarized
let g:airline_theme='badwolf'
