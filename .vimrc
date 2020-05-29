"vypne kompatibilitu s Vi
set nocompatible
set exrc
set history=1000
"zapne klasické použití backspace
set backspace=2
set nojoinspaces
"zobrazuje zapnutý režim
set showmode
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest
set background=dark

"syntax highlighting
syntax on

"rozpoznání jednotlivých kódování
set fileencodings=utf-8,latin2

"český slovník překlepů
"set spelllang=cs
"zapne slovník
"set spell

"search
set hlsearch
set incsearch

"indenting
set nopaste
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab
set smartindent
set expandtab

"check the indent settings with:
":verbose set autoindent? smartindent? cindent? cinkeys? indentexpr?

"show the current line and column number
set ruler

" vim-plug - Minimalist Vim Plugin Manager - https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/airblade/vim-gitgutter.git', { 'commit': 'b356cc9a7da08ebeb919cd04b2831dad71a34d38' }
Plug 'https://github.com/itchyny/lightline.vim.git', { 'commit': 'c172131e0369672bc1b9454a2aec6d532d350dcc' }
Plug 'https://github.com/preservim/nerdtree.git',  { 'tag': '6.7.15' }
Plug 'https://github.com/Yggdroot/indentLine.git', { 'commit': '15aceda8c4eea621b66faa8673fca0b9fbe2f457' }
call plug#end()

map ; :Files<CR>
map <C-n> :NERDTreeToggle<CR>

"enable lightline
set laststatus=2
