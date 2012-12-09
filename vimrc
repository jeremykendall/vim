" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source! %

filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin on
filetype plugin indent on

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead,BufNewFile *_spec.rb nmap <F8> :!rspec --color %<CR>

let mapleader=","

set nocompatible
set modeline
set modelines=5

map! jj <Esc>

syntax on

set t_Co=256
colorscheme solarized

if has('gui_running')
    set background=light
else
    set background=dark
endif

set number

set colorcolumn=85
set textwidth=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set ruler
set encoding=utf-8
set scrolloff=3
set showmode
set shiftround
set autoindent
set smartindent

" Source .vimrc on change
autocmd! bufwritepost .vimrc source $MYVIMRC

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" Space bar clears search highlighting/messages displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" NERDTree options
:let NERDChristmasTree=1
:let NERDTreeCaseSensitiveSort=1
:let NERDTreeChDirMode=2
:let NERDTreeBookmarksFile = $HOME . "/.vim/NERDTreeBookmarks"
:let NERDTreeShowBookmarks=1
:let NERDTreeShowHidden=1
:let NERDTreeQuitOnOpen=0
:map <Leader>, :NERDTreeToggle<CR>

set undofile

" Turn on "very magic" regex status by default for searches.
" :he /magic for more information
nnoremap / /\v
vnoremap / /\v

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" Force good behavior by disabling arrow keys in normal and insert modes
" see
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" j and k move by screen line rather than file line. w00t!
nnoremap j gj
nnoremap k gk

" Split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Include git branch, if available, in status line
" This one is for the vim-fugitive plugin:
:set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" gist-vim
let g:gist_open_browser_after_post = 1
