let mapleader=","

map! kj <Esc>

" Load vimrc in new tab with leader-v
nmap <leader>v :tabedit $MYVIMRC<CR>

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
