call plug#begin("~/.vim/plugged")
  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'  
  " File Explorer
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'pacha/vem-tabline'
  " theme
  Plug 'dracula/vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Utility
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  " Git
  Plug 'airblade/vim-gitgutter'
  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

call plug#end()

set ttyfast
set mouse=a
set hidden
" Line Numbers
set number
set numberwidth=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping
noremap  <silent> <C-s>    :update<CR>
vnoremap <silent> <C-s>    <C-C>:update<CR>
inoremap <silent> <C-s>    <C-O>:update<CR>

" Theme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
let g:airline_theme='powerlineish'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrated Terminal
" " open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Commentary
autocmd FileType apache setlocal commentstring=#\ %s

"Tabline 
nmap <C-x> <Plug>vem_delete_buffer-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation between panes
" use alt+hjkl to move between split/vsplit panels
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
