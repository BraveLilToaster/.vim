""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Language support and syntax highlighting
Plug 'vim-syntastic/syntastic'
"Plug 'pangloss/vim-javascript'
"Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
let mapleader=" "

" Reload vimrc
map <leader>s :source ~/.vimrc<CR>

" Automatically update a file if it is changed externally
set autoread

" Enable syntax highlighting
syntax on

" FILE TYPES
filetype on
filetype plugin on

" Mouse on
set mouse=a

" Copy from vim to clipboard
" Must make certain that +clipboard is enabled
" :echo has('clipboard')
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""
" THEME
"""""""""""""""""""""""""""""""""""""""""""""""""
" Set Theme
colorscheme molokai
let g:molokai_original = 1
set term=screen-256color
set guifont=Menlo\ Regular:h18

set colorcolumn=90
set number

"""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT FORMATTING
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 2 spaces
set ts=2 sw=2
set expandtab

set si "smartindent
set ai "autoindent

" enable filetype specific indentation
filetype indent on

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Auto-toggle paste mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch " Hightlighted search
set ignorecase
nnoremap <silent> <BS> :nohlsearch<Bar>:echo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"""""""""""""""""""""""""""""""""""""""""""""""""
" GIT GUTTER
"""""""""""""""""""""""""""""""""""""""""""""""""
" Always show gitgutter
let g:gitgutter_sign_column_always=1

"""""""""""""""""""""""""""""""""""""""""""""""""
" vim-jsx Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting for files with .js extension
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint', 'gjslint']
