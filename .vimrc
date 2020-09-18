syntax on

"colorscheme molokai
"colorscheme material

highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight Comment gui=italic
highlight Type    gui=italic
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type    cterm=italic
highlight Keyword gui=italic
highlight Keyword cterm=italic
highlight Function gui=italic
highlight Function cterm=italic
highlight Conditional gui=italic
highlight Conditional cterm=italic
highlight Repeat gui=italic
highlight Repeat cterm=italic
highlight Label gui=italic
highlight Label cterm=italic
highlight Exception gui=italic
highlight Exception cterm=italic
highlight Structure gui=italic
highlight Structure cterm=italic
highlight StorageClass gui=italic
highlight StorageClass cterm=italic
highlight Typedef gui=italic
highlight Typedef cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Utility
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ryanoasis/vim-devicons' " not working with current font

" Generic Programming Support 

" TypeScript Support
Plug 'jb55/typescript-ctags'
call plug#end()


let g:airline_theme = 'material'
if (has('termguicolors'))
  set termguicolors
endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'

colorscheme material

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline
set encoding=UTF-8

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Mouse Integration
set mouse=a
let g:NERDTreeMouseMode=3

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
map <C-j> :bprevious<CR>
map <C-k> :bnext<CR>

" MERDTree setup
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusConcealBrackets = 1

" Tagbar
nmap <C-m> :TagbarToggle<CR>

" Tagbar Typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
