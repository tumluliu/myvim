set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'c.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'klen/python-mode'
Plugin 'junegunn/vim-easy-align'
Plugin 'rhysd/vim-clang-format'
Plugin 'funorpain/vim-cpplint'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'wincent/command-t'

call vundle#end()

filetype plugin indent on
set laststatus=2
set relativenumber
set undofile
syntax enable
set number
colorscheme solarized
set ts=4
set sw=4
set hlsearch
set ai
set ci
set et
set ruler
set guifont=Ubuntu\ Mono\ 14
" set guifont=M\+\ 2m\ 14

if has("gui_running")
  set background=light
  autocmd VimEnter * NERDTree
else
  set background=dark
endif

" YouCompleteMe (YCM) setup
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_c.py"
let g:ycm_confirm_extra_conf = 0

" NERDTree setup
nmap <F8> :NERDTreeToggle<CR>

" Python-mode setup
" Disable rope completion since it is conflict with YCM
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" Disable linting, use syntastic instead
let g:pymode_lint_write = 0
" let g:pymode_lint = 1
" let g:pymode_lint_checker = 'pyflakes,pep8'
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
" make vim-airline use powerline symbols
"let g:airline_powerline_fonts = 1

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
let mapleader=' '

map <F6> :pyf /usr/local/bin/clang/tools/clang-format<cr>
" imap <C-K> <c-o>:pyf /usr/local/bin/clang/tools/clang-format<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set showmode
set showcmd
"set visualbell
set cursorline
set ttyfast
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
au FocusLost * :wa
