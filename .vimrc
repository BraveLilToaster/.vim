runtime vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set number
set guifont=Menlo\ Regular:h18
set mouse=a

" Color Settings
set t_Co=256
colorscheme molokai
let g:rehash256 = 1

" Leader Key
let mapleader=" "

" Reload vimrc
map <leader>s :source ~/.vimrc<CR>

" Remove Whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Hightlighted search
set hlsearch
nnoremap <silent> <BS> :nohlsearch<Bar>:echo<CR>

" Reindex all files for command-t search
noremap <Leader>r :CommandTFlush<CR>

" NERDTree Settings
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
" for windows?
" autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Always show gitgutter
let g:gitgutter_sign_column_always=1


" vim-haml (also sass)
au FileType javascript setl sw=2 sts=2 et

set backspace=indent,eol,start
