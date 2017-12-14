call plug#begin('~/.config/nvim/plugged')

" VIM theme solarized
Plug 'altercation/vim-colors-solarized'
" VIM theme gruvbox
Plug 'morhetz/gruvbox'
" File directory explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
" Dark powered neo-completion for keyword completion
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" deoplete.nvim autocompletion source for Python
Plug 'zchee/deoplete-jedi'
" Perform all your vim insert mode completions with the <Tab> key
Plug 'ervandew/supertab'
" Async syntax checking plugin that runs files through external syntax checkers
Plug 'neomake/neomake'
" A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" A formatter for a various of languages
Plug 'Chiel92/vim-autoformat'
Plug 'maksimr/vim-jsbeautify'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Git wrapper
Plug 'tpope/vim-fugitive'
" True Sublime Text style multiple selections for Vim
"Plug 'terryma/vim-multiple-cursors'
" vim bundle for Racket
"Plug 'wlangstroth/vim-racket'
" A vim plugin for syntax highlighting Ansible's common filetypes
Plug 'pearofducks/ansible-vim'

call plug#end()

" Enable terminal true color for neovim
"set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Set cursor shapes for different modes
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" Enable deoplete autocompletion on startup
let g:deoplete#enable_at_startup=1

let mapleader="\<SPACE>"

if has('autocmd')
    filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

set showmode
set showmatch
set showcmd
set laststatus=2
set statusline+=%{fugitive#statusline()}
set relativenumber
set undofile
set number
set ts=4
set sw=4
set hlsearch
set ai
set ci
set et
set ruler
set mouse=a

colorscheme gruvbox
if has("gui_running")
    set background=light
    set guifont=Monaco:h14
else
    set background=dark
endif

" Relative numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
        set number
    else
        set rnu
    endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" neomake config, used as a linter for Python and JavaScript, a builder for C
autocmd! BufWritePost * Neomake
set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
let g:neomake_open_list = 2
" the external JavaScript linter eslint is installed with npm
let g:neomake_javascript_enabled_makers = ['eslint']
" the external Python linter flake8 is installed with homebrew
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_warning_sign = { 'text': 'W>', 'texthl': 'WarningMsg' }
let g:neomake_error_sign = { 'text': 'E>', 'texthl': 'ErrorMsg' }
"let g:neomake_verbose=3
"let g:neomake_logfile='/Users/user/neomake.log'

" remap easy-align hotkey from default ga to <Leader>a
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" NERDTree setup
nmap <F8> :NERDTreeToggle<CR>

" config vim-autoformat hotkey to <F3>
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1
let g:formatters_python = ['yapf']
" config vim-jsbeautify
".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" for YAML in Ansible
autocmd FileType yaml setl sw=2 sts=2 et

" make vim-airline use powerline symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme = 'gruvbox'

" config for multiple-cursors
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" set visualbell
set cursorline
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
" disable arrows key
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
" Copy to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Switch between splits
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
if has('nvim')
    nmap <BS> <C-W>h
endif
