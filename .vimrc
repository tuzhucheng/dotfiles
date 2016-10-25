set nocompatible " be iMproved
filetype off " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
" Essentials
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'

" Appearance
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Pychimp/vim-luna'
Plugin 'tpope/vim-vividchalk'

" Web development
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'digitaltoad/vim-jade'

" Functional programming
Plugin 'wlangstroth/vim-racket'
Plugin 'derekwyatt/vim-scala'

" All Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
syntax enable

set tabstop=4 " set the width of a tab to 4
set shiftwidth=4 " set the indent to width of 4
set softtabstop=4 " set the number of columns for a tab
set expandtab " expand tabs to spaces
set number
set t_Co=16
set laststatus=2
set mouse=a
set background=dark
set hlsearch
colorscheme solarized
let g:airline_theme='badwolf'

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

" Strip trailing whitespace
nnoremap <leader><space> :%s/\s\+$//<CR>

" closetag
let g:closetag_html_style=1
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
" autocomplete when pressing space for html tags
" ":iabbrev </ </<C-X><C-O>

" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.d$']

" auto open NERDTree if no file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Tagbar
nnoremap <leader>] :TagbarToggle<CR>

" ctrlp
nnoremap <leader>t :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" grep setting for LaTeX suite
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
set sw=4

autocmd filetype crontab setlocal nobackup nowritebackup

