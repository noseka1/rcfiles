"Configuration based on:
"https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
"https://dougblack.io/words/a-good-vimrc.html
"https://danielmiessler.com/blog/vim-configuration-update-2019-version/

"Copy indent from current line when starting a new line
set autoindent
"Use the appropriate number of spaces to insert a <Tab>
set expandtab
"Round indent to multiple of 'shiftwidth', applies to > and < commands
set shiftround
"Number of spaces to use for each step of (auto)indent
set shiftwidth=2
"When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab
"Number of spaces that a <Tab> in the file counts for
set tabstop=2
"Do smart autoindenting when starting a new line.  Works for C-like programs, but can also be used for other languages
set smartindent
"Check the indent settings with:
":verbose set autoindent? smartindent? cindent? cinkeys? indentexpr?
"Always let some lines after the cursor
set scrolloff=10

"Search options

"When there is a previous search pattern, highlight all its matches
set hlsearch
"While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

"User interface options

"Enable syntax highlighting
syntax on
"Always show the status line (lightline plugin)
set laststatus=2
"-- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline (lightline plugin)
set noshowmode
"Prevent No write since last change (add ! to override) when switching from buffer with unsaved changes
"Apparently netrw does not play well with this setting, see also https://vi.stackexchange.com/a/9180
set hidden
"Show vim tab line even if only one file is open, needed to display lightline-bufferline
set showtabline=2
"Always show the current line and column number
set ruler
"Display command line's tab complete options as a menu
set wildmenu
"When more than one match, list all matches and complete till longest common string
set wildmode=list:longest
"Show line numbers on the sidebar
set number
"Use visual bell instead of beeping
set visualbell
"Set the window's title, reflecting the file currently being edited
set title
"Use colors that suit a dark background
set background=dark
"Enable mouse support
set mouse=
"Make the mouse selection highlighting work in Alacritty, see also: https://github.com/alacritty/alacritty/issues/803
set ttymouse=sgr
"Use X clipboard, auto-copy selection to clipboard
set clipboard=unnamedplus
"Check that the clipboard is available with (if the output is 0, it's not available, if it's 1, it is available):
":echo has('clipboard')

"Undo options

"Increase the undo limit
set history=1000
"Persistent undo
set undodir=$HOME/.vim/undo
set undofile

"Put all swap files in the same place
set directory^=$HOME/.vim/swap//

"Highlight the current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=233

"Misc options

"Allow backspacing over indention, line breaks and insertion start
set backspace=indent,eol,start
"Automatically re-read files if unmodified inside Vim
set autoread
"When a bracket is inserted, briefly jump to the matching one
set showmatch

"Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Load indentation rules and plugins according to the detected filetype
filetype plugin indent on

"Toggle paste mode
nnoremap <leader>p :set paste!<CR>
"Toggle visual aids
nnoremap <leader>v :set number!<CR>:IndentGuidesToggle<CR>:GitGutterSignsToggle<CR>
"Clear highlighting
nnoremap <leader>c :nohl<CR>

"Don't move the cursor after yanking in visual mode, see also:
"https://stackoverflow.com/questions/3806629/yank-a-region-in-vim-without-the-cursor-moving-to-the-top-of-the-block
vmap y ygv<Esc>

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
  call minpac#add('https://github.com/luochen1990/rainbow',               {'commit':'76ca1a20aa42edb5c65c19029968aad4625790dc'})
  call minpac#add('https://github.com/chrisbra/Colorizer',                {'commit':'7db0e0dd8adfccab35655f5b6db805caa0fef49a'})
  call minpac#add('https://github.com/noseka1/vim-yaml-folds',            {'commit':'master'})
  call minpac#add('https://github.com/tomasiser/vim-code-dark',           {'commit':'4624dc223bf574aa9a731c2383c579847303c380'})
endfunction

"Try to load colorscheme, ignore if it doesn't exist
"If the colors seem to be wrong, make sure you have a terminal with 256 colors. E.g. set terminal to xterm-256color in MobaXterm
silent! colorscheme codedark

"Show the list of buffers
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

"Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

"Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

"Span the entire screen
let g:fzf_layout = {'left': '100%'}
"Toggle preview window using Ctrl-/
let g:fzf_preview_window = ['right:70%', 'ctrl-/']

"Enable rainbow-colored parenthesis
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"Indent guides colors
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235

"Start editing a file with all folds open
set foldlevelstart=99

"Unfold to a specific level
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

"Indention options for varous languages
autocmd FileType go setlocal noexpandtab
autocmd FileType yaml setlocal indentkeys-=0#
autocmd FileType json setlocal foldmethod=syntax foldtext=yamlfolds#JsonFoldText()
