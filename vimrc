set nocompatible

" Disable the splash screen
:set shortmess +=I

set clipboard=unnamed

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source! %

filetype off
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead,BufNewFile *_spec.rb nmap <F8> :!rspec --color %<CR>
au BufRead,BufNewFile *.twig set syntax=htmljinja

let mapleader=","

" Load vimrc in new tab with leader-v
nmap <leader>v :tabedit $MYVIMRC<CR>

" tab navigation
nmap Z :tabprev<CR>
nmap X :tabnext<CR>

set wildmenu
set wildmode=list:longest
set ttyfast
set modeline
set modelines=5

map! kj <Esc>

set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
colorscheme solarized

set background=dark

set number

" Show me when I'm getting too close to 80 characters
if version > 702
    set colorcolumn=80
endif
" set textwidth=80

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

" Allows closing vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" "Hidden" buffers -- i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
set hidden

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

" vim-php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"  " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"               " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_default_mapping = 0          " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
map <leader>pcf :call PhpCsFixerFixFile()<CR>

" ctrlp ignore
set wildignore+=*/tmp/*,*/build/*,*/log/*,*.~,*.so,*.swp,*.zip,*/docs/*,*/cache/*
" ctrlp starting directory
let g:ctrlp_working_path_mode = ''
