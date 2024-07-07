"configuration based on:
"https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
"https://dougblack.io/words/a-good-vimrc.html
"https://danielmiessler.com/blog/vim-configuration-update-2019-version/

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

"enable syntax highlighting
syntax on
"always show the status line (lightline plugin)
set laststatus=2
"-- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline (lightline plugin)
set noshowmode
"prevent No write since last change (add ! to override) when switching from buffer with unsaved changes
set hidden
"show vim tab line even if only one file is open, needed to display lightline-bufferline
set showtabline=2
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
"enable mouse support
set mouse=
"make the mouse selection highlighting work in Alacritty, see also: https://github.com/alacritty/alacritty/issues/803
set ttymouse=sgr
"use X clipboard, auto-copy selection to clipboard
set clipboard=unnamedplus
"check that the clipboard is available with (if the output is 0, it's not available, if it's 1, it is available):
":echo has('clipboard')

"undo options

"increase the undo limit
set history=1000
"persistent undo
set undodir=$HOME/.vim/undo
set undofile

"highlight the current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=233

"misc options

"allow backspacing over indention, line breaks and insertion start
set backspace=indent,eol,start
"automatically re-read files if unmodified inside Vim
set autoread
"when a bracket is inserted, briefly jump to the matching one
set showmatch

"jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"load indentation rules and plugins according to the detected filetype
filetype plugin indent on

"toggle paste mode
nnoremap <leader>p :set paste!<CR>
"toggle visual aids
nnoremap <leader>v :set number!<CR>:IndentGuidesToggle<CR>:GitGutterSignsToggle<CR>
"clear highlighting
nnoremap <leader>c :nohl<CR>

"colorscheme lunaperche

"minpac: A minimal package manager for Vim 8, https://github.com/k-takata/minpac
function! PackInit() abort
  packadd minpac
  call minpac#init({'verbose': 3,'confirm':'FALSE','progress_open':'none'})
  call minpac#add('https://github.com/airblade/vim-gitgutter.git',        {'commit':'256702dd1432894b3607d3de6cd660863b331818'})
  call minpac#add('https://github.com/itchyny/lightline.vim.git',         {'commit':'a29b8331e1bb36b09bafa30c3aa77e89cdd832b2'})
  call minpac#add('https://github.com/preservim/vim-indent-guides',       {'commit':'a1e1390c0136e63e813d051de2003bf0ee18ae30'})
  call minpac#add('https://github.com/mengelbrecht/lightline-bufferline', {'commit':'61c7c8668b80537aefa69654a6e5a5e63095be61'})
  call minpac#add('https://github.com/junegunn/fzf',                      {'commit':'c4a9ccd6afc3698a57a6b938ebba6d85238033e2'})
  call minpac#add('https://github.com/junegunn/fzf.vim',                  {'commit':'279e1ec068f526e985ee7e3f62a71f083bbe0196'})
  call minpac#add('https://github.com/google/vim-jsonnet',                {'commit':'b7459b36e5465515f7cf81d0bb0e66e42a7c2eb5'})
  call minpac#add('https://github.com/frazrepo/vim-rainbow',              {'commit':'a6c7fd5a2b0193b5dbd03f62ad820b521dea3290'})
  call minpac#add('https://github.com/pedrohdz/vim-yaml-folds',           {'commit':'890ccd8e5370808d569e96dbb06cbeca2cf5993a'})
endfunction

"use darker color for indent lines
let g:indentLine_color_term = 236

"show the list of buffers
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.colorscheme      = 'one'

nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>

"mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

"span the entire screen
let g:fzf_layout = {'left': '100%'}
"toggle preview window using Ctrl-/
let g:fzf_preview_window = ['right:70%', 'ctrl-/']

"enable rainbow-colored parenthesis
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"indent guides colors
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233

"define custom fold text for JSON files. Code copied from the vim-yaml-folds plugin, func YamlFoldText()
function! JsonFoldText()
  let lines = v:foldend - v:foldstart
  return getline(v:foldstart) . '   (level ' . v:foldlevel . ', lines ' . lines . ')'
endfunction

"start editing a file with all folds open
set foldlevelstart=99

"unfold to a specific level
nmap z0 :set foldlevel=0<CR>
nmap z1 :set foldlevel=1<CR>
nmap z2 :set foldlevel=2<CR>
nmap z3 :set foldlevel=3<CR>
nmap z4 :set foldlevel=4<CR>
nmap z5 :set foldlevel=5<CR>
nmap z6 :set foldlevel=6<CR>
nmap z7 :set foldlevel=7<CR>
nmap z8 :set foldlevel=7<CR>
nmap z9 :set foldlevel=9<CR>

"indention options
autocmd FileType go setlocal noexpandtab
autocmd FileType yaml setlocal indentkeys-=0#
autocmd FileType json setlocal foldmethod=syntax foldtext=JsonFoldText()
