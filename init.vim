call plug#begin("~/.vim/plugged")
  " Language Client
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  Plug 'vim-syntastic/syntastic'
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'  
  " File Explorer
  Plug 'scrooloose/nerdtree'
  " pairs
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/tagbar'
  " File icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'pacha/vem-tabline'
  " theme
  Plug 'dracula/vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-dispatch'
  Plug 'Shougo/deoplete.nvim'
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  " Integration:tab
  " Plug 'wakatime/vim-wakatime'
  " Utility
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'qpkorr/vim-bufkill'
  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'rbong/vim-flog'
  " File Tags
  " Plug 'ludovicchabant/vim-gutentags'
  Plug 'preservim/tagbar'
  " File Types
  Plug 'leafgarland/typescript-vim'
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

set ruler

" OSX stupid backspace fix
set backspace=indent,eol,start

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
"set smarttab
"set expandtab
set cursorline

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#show_close_button=1
" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{FugitiveStatusline()}

let g:deoplete#enable_at_startup = 1
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
nnoremap <c-n> :call OpenTerminal()<CR>FugitiveStatusline

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript

" Tagbar
" autocmd FileType javascript,typescript,js,jsx,ts,tsx TagbarOpen
autocmd BufWinEnter *.js,*.ts :TagbarOpen
autocmd BufWinLeave *.js,*.ts :TagbarClose
nmap <F8> :TagbarToggle<CR>

" Commentary
autocmd FileType apache setlocal commentstring=#\ %s

"Tabline 
nmap <C-x> <Plug>vem_delete_buffer-

" Syntastic
set signcolumn=yes
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
"let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': ['js', 'html', 'template'],
"                           \ 'passive_filetypes': ['java'] }
let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_filetype_map = { "tsx": "typescript" }

let g:syntastic_typescriptreact_checkers = ['eslint']
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
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap c :bp\|bd #<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Rg<CR>
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

" Cursive font
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic

" Tab shortcuts
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>
