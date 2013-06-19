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
