set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
" Essentials
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'wincent/command-t'
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
Plugin 'derekwyatt/vim-scala'

" Configurations for built-in functionalities
filetype plugin indent on
syntax enable

set tabstop=2 " set the width of a tab to 4
set shiftwidth=2 " set the indent to width of 4
set softtabstop=2 " set the number of columns for a tab
set expandtab " expand tabs to spaces
set number
set t_Co=16
set laststatus=2
set mouse=a
set background=dark
colorscheme solarized
let g:airline_theme='badwolf'

" Tabs
map <F7> :tabp<CR>
map <F8> :tabn<CR>

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

" GUI
if has("gui_running")
    if has ("gui_gtk2")
        set guifont=Monospace\ 11
    elseif has("gui_macvim")
"        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
"        set guifont=Consolas:h11:cANSI
    endif
endif

" grep setting for LaTeX suite
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
set sw=2

