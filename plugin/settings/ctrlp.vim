" ctrlp ignore
set wildmode=list:longest
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
let g:ctrlp_working_path_mode = ''
