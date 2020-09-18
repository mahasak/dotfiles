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

" Windows & Appearance
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
"Plug 'ryanoasis/vim-devicons' " not working with current font

" Generic Programming Support 
Plug 'jakedouglas/exuberant-ctags'
call plug#end()


let g:airline_theme = 'material'
if (has('termguicolors'))
  set termguicolors
endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

colorscheme material
" Common setting
set encoding=UTF-8
" Mouse Integration
set mouse=a
let g:NERDTreeMouseMode=3

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
