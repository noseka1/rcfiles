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
set hlsearch
"set smartindent
"set shiftwidth=4
"set smarttab
" convert tabs to spaces
set expandtab
set wildmenu
set wildmode=list:longest

set background=dark

"zvýrazňování syntaxe
syntax on

"rozpoznání jednotlivých kódování
set fileencodings=utf-8,latin2

"český slovník překlepů
"set spelllang=cs
"zapne slovník
"set spell

"no indenting while pasting
set paste

"show the current line and column number
set ruler


" vim-plug - Minimalist Vim Plugin Manager - https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
call plug#end()

map ; :Files<CR>
map <C-n> :NERDTreeToggle<CR>
