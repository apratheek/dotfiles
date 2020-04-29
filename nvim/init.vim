" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax enable

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show hybrid line numbers
set number relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell
set noerrorbells " Disable beep on errors

set title " Set the window’s title, reflecting the file currently being edited

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" 256 color support
set termguicolors

" Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
set smarttab


" Vertical/Horizontal scroll off settings
set scrolloff=3     " The number of screen lines to keep above and below the cursor
set sidescrolloff=7 " The number of screen columns to keep to the left and right of the cursor
set sidescroll=1    " Incrementally scroll one character at a time to reveal more text as needed

" Cursor motion
set complete-=i
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" Allow hidden buffers
set hidden

" Rendering
set ttyfast
set lazyredraw " redraw only when we need to.

" Always display status bar
set laststatus=2
" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}(%{&fenc})]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Set the command mode wildmenu
set wildmenu
set wildmode=list:longest,full

set tabpagemax=50 " Maximum number of tab pages that can be opened from the command line

" Last line
set showmode
set showcmd
"store lots of :cmdline history
set history=1000

" set mouse=a     " Enable mouse usage (all modes)

" Highlight the line on which the cursor is placed
set cursorline

set confirm " Display a confirmation dialog when closing an unsaved file.

set wildignore+=.pyc,.swp " Ignore files matching these patterns when opening files based on a glob pattern

" Searching
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set showmatch   " highlight matching [{()}]

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Folding
set foldenable          " enable folding
set foldmethod=manual   " folds must be defined by entering commands (using markers)

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set list
set listchars=tab:▸\ ,eol:¬,trail:•,extends:#,nbsp:.
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL


" Spell check
iabbrev teh the

" Plugins here








" Plugin specific rules