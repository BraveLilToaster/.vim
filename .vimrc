" LOADING
execute pathogen#infect()

" LEADER
let mapleader=" "

" FILE TYPES
filetype on
filetype plugin on

" THEME & LAYOUT
colorscheme molokai
set guifont=Menlo\ Regular:h18
" set lines=35 columns=150
set colorcolumn=90
set number
syntax on
let g:gitgutter_sign_column_always=1 " Always show gitgutter

" TEXT FORMATTING
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set smartindent
set autoindent
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespaces on save

" SEARCH
set hlsearch " Hightlighted search
nnoremap <silent> <BS> :nohlsearch<Bar>:echo<CR>

" Color Settings
set t_Co=256
let g:rehash256 = 1

" Reload vimrc
map <leader>s :source ~/.vimrc<CR>

" Reindex all files for command-t search
noremap <Leader>r :CommandTFlush<CR>

" NERDTree Settings
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
