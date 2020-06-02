"configuration based on:
"https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
"https://dougblack.io/words/a-good-vimrc.html
"https://danielmiessler.com/blog/vim-configuration-update-2019-version/

"indention options

"copy indent from current line when starting a new line
set autoindent
"use the appropriate number of spaces to insert a <Tab>
set expandtab
"round indent to multiple of 'shiftwidth', applies to > and < commands
set shiftround
"number of spaces to use for each step of (auto)indent
set shiftwidth=2
"when on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab
"number of spaces that a <Tab> in the file counts for
set tabstop=2
"do smart autoindenting when starting a new line.  Works for C-like programs, but can also be used for other languages
set smartindent
"check the indent settings with:
":verbose set autoindent? smartindent? cindent? cinkeys? indentexpr?

"search options

"when there is a previous search pattern, highlight all its matches
set hlsearch
"while typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

"user interface options

"always show the status line
set laststatus=2
"always show the current line and column number
set ruler
"display command line's tab complete options as a menu
set wildmenu
"When more than one match, list all matches and complete till longest common string
set wildmode=list:longest
"show line numbers on the sidebar
set number
"use visual bell instead of beeping
set visualbell
"set the window's title, reflecting the file currently being edited
set title
"use colors that suit a dark background
set background=dark

"undo options

"increase the undo limit
set history=1000
"persistent undo
set undodir=$HOME/.vim/undo
set undofile

"use X clipboard
set clipboard=unnamed
"check that the clipboard is available with:
":echo has('clipboard')

"misc options

"allow backspacing over indention, line breaks and insertion start
set backspace=indent,eol,start
"automatically re-read files if unmodified inside Vim
set autoread
"when a bracket is inserted, briefly jump to the matching one
set showmatch

"remap the leader key
let mapleader="'"

"toggle paste mode
set pastetoggle=<leader>p
"clear highlighting
nnoremap <leader>c :nohl<CR>
"toggle indent lines
nnoremap <leader>i :IndentLinesToggle<CR>

colorscheme default

"vim-plug - Minimalist Vim Plugin Manager - https://github.com/junegunn/vim-plug

"cpecify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/airblade/vim-gitgutter.git', { 'commit': 'b356cc9a7da08ebeb919cd04b2831dad71a34d38' }
Plug 'https://github.com/itchyny/lightline.vim.git', { 'commit': 'c172131e0369672bc1b9454a2aec6d532d350dcc' }
Plug 'https://github.com/preservim/nerdtree.git',  { 'tag': '6.7.15' }
Plug 'https://github.com/Yggdroot/indentLine.git', { 'commit': '15aceda8c4eea621b66faa8673fca0b9fbe2f457' }
call plug#end()

map ; :Files<CR>
map <C-n> :NERDTreeToggle<CR>

"use darker color for indent lines
let g:indentLine_color_term = 236
