set nocompatible

" Disable the splash screen
:set shortmess +=I

set clipboard=unnamed

" Make backspace work properly
" http://vim.wikia.com/wiki/Erasing_previously_entered_characters_in_insert_mode
:set backspace=indent,eol,start

filetype off
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead,BufNewFile *_spec.rb nmap <F8> :!rspec --color %<CR>
au BufRead,BufNewFile *.twig set syntax=htmljinja
au BufRead,BufNewFile Vagrantfile set syntax=ruby

" Reload files changed outside vim
set autoread 

set ttyfast
set modeline
set modelines=5

set number

" Show me when I'm getting too close to 80 characters
set colorcolumn=81

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set ruler
set cursorline
set encoding=utf-8
set fileencodings=utf-8
set scrolloff=3
set showmode
set shiftround
set autoindent
set smartindent

set pastetoggle=<F11>

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" Stolen from https://github.com/skwp/dotfiles/blob/master/vimrc
if (exists('+undofile') && exists('+undodir'))
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" ================ Turn Off Swap Files ==============
" Stolen from https://github.com/skwp/dotfiles/blob/master/vimrc
set noswapfile
set nobackup
set nowb

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" "Hidden" buffers -- i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
set hidden

" Resize splits when resizing terminal
autocmd VimResized * wincmd =

" Open current file in Marked2
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Do not conceal quotes in vim-json plugin
" https://github.com/elzr/vim-json
let g:vim_json_syntax_conceal = 0
