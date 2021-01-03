call plug#begin("~/.vim/plugged")
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  " Plugin Section
  Plug 'dracula/vim'
call plug#end()

" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>


