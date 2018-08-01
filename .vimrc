""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Navigation and Status Bar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" IDE like functions
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" JavaScript syntax
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
let mapleader="\<Space>"

" Reload vimrc
map <leader>s :autocmd BufWritePost ~/.vimrc source %<CR>

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

" watch vimrc for chnages and update vim on the fly
autocmd BufWritePost .vimrc so %

"
set timeoutlen=1000 ttimeoutlen=0

" Fix for webpack watch on vim files
set backupcopy=yes
"""""""""""""""""""""""""""""""""""""""""""""""""
" THEME
"""""""""""""""""""""""""""""""""""""""""""""""""
" Set Theme
colorscheme molokai
let g:rehash256 = 1
set t_Co=256
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT FORMATTING
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 2 spaces
set ts=2 sw=2
set expandtab

set si "smartindent
set ai "autoindent

"
set colorcolumn=90
set number

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

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType php setlocal autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch " Hightlighted search
set ignorecase
nnoremap <silent> <BS> :nohlsearch<Bar>:echo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
"let NERDTreeIgnore=['\.DS_Store', '\~$', '\.sw*']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
"""""""""""""""""""""""""""""""""""""""""""""""""
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"""""""""""""""""""""""""""""""""""""""""""""""""
" vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lightline
"""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
 \ 'active': {
 \   'left': [ [ 'mode', 'paste' ],
 \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
 \ },
 \ 'component': {
 \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
 \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
 \   'fugitive': '%{exists("*fugitive#head")?" ".fugitive#head():""}'
 \ },
 \ 'component_function': {
 \   'filetype': 'MyFiletype',
 \   'fileformat': 'MyFileformat',
 \ },
 \ 'component_visible_condition': {
 \   'readonly': '(&filetype!="help"&& &readonly)',
 \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
 \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
 \ },
 \ 'separator': { 'left': '', 'right': '' },
 \ 'subseparator': { 'left': '', 'right': '' }
 \ }

"""""""""""""""""""""""""""""""""""""""""""""""""
" vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set guifont=Knack\ Nerd\ Font\ Regular\ 11
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" GIT GUTTER
"""""""""""""""""""""""""""""""""""""""""""""""""
" Always show gitgutter
set signcolumn=yes

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

let g:syntastic_javascript_checkers = ['eslint']
