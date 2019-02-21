set nocompatible

filetype off
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" Disable the splash screen
:set shortmess +=I

" When the "unnamed" string is included in the 'clipboard' option, the unnamed
" register is the same as the "* register.  Thus you can yank to and paste the
" selection without prepending "* to commands.
if $TMUX == ''
    set clipboard+=unnamed
endif

" Make backspace work properly
" http://vim.wikia.com/wiki/Erasing_previously_entered_characters_in_insert_mode
:set backspace=indent,eol,start

au BufRead,BufNewFile .php_cs set filetype=php
au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead,BufNewFile *.pp set syntax=ruby
au BufRead,BufNewFile *_spec.rb nmap <F8> :!rspec --color %<CR>
au BufRead,BufNewFile Vagrantfile set syntax=ruby
au BufRead,BufNewFile *.twig,*.html.twig set filetype=htmldjango
au BufRead,BufNewFile *.twig,*.html.twig set syntax=htmljinja
au BufRead,BufNewFile composer.lock set syntax=json
au BufRead,BufNewFile *.yml.dist set syntax=yaml
au BufRead,BufNewFile *.xml.dist set syntax=xml

" For solarized coloring
set t_Co=256
set background=dark
colorscheme solarized

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

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" Stolen from https://github.com/skwp/dotfiles/blob/master/vimrc
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

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

" NERDTree options
:let NERDChristmasTree=1
:let NERDTreeCaseSensitiveSort=1
:let NERDTreeChDirMode=2
:let NERDTreeBookmarksFile = $HOME . "/.vim/NERDTreeBookmarks"
:let NERDTreeShowBookmarks=1
:let NERDTreeShowHidden=1
:let NERDTreeQuitOnOpen=0

" Allows closing vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ctrlp settings
" ctrlp ignore
set wildmode=list,longest,full
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/tmp/*
set wildignore+=*/build/*
set wildignore+=*/log/*
set wildignore+=*.zip*
set wildignore+=*.~,
set wildignore+=*/docs/*
set wildignore+=*/cache/*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ctrlp starting directory
let g:ctrlp_working_path_mode = 'r'

" gist-vim
let g:gist_open_browser_after_post = 1

" keymappings
let mapleader=","

map! kj <Esc>

" tab navigation
nmap Z :tabprev<CR>
nmap X :tabnext<CR>

" Space bar clears search highlighting/messages displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" Turn on "very magic" regex status by default for searches.
" :he /magic for more information
nnoremap / /\v
vnoremap / /\v

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

:map <Leader>, :NERDTreeToggle<CR>

" Load vimrc in new tab with leader-v
nmap <leader>v :tabedit $MYVIMRC<CR>

" Source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" vim-php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_level = "all"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_default_mapping = 0
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_fixers_list = "-single_blank_line_before_namespace,-pre_increment,-concat_without_spaces,concat_with_spaces,ordered_us"
map <leader>pcf :call PhpCsFixerFixFile()<CR>

" ctags
set tags=tags

" Load a tag file
" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim.tags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")
:call LoadTags('PHPUnit')
:call LoadTags('Composer')
:call LoadTags('OpenSky')
:call LoadTags('Symfony2')

" vim-fugitive
" Include git branch, if available, in status line
" This one is for the vim-fugitive plugin:
:set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Taken from http://www.bestofvim.com/tip/trailing-whitespace/
" show trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Settings for python-syntax: https://github.com/hdima/python-syntax
let python_version_2 = 1

" Powerline
set rtp+=/Users/jeremykendall/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" Sane paste w/o indent
nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>
