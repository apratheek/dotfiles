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

" Set neovim's updatetime
set updatetime=100

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

" Func for defining the tablabel
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()


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

" Persistent undo
set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir " This is the directory in which the undofiles are stored (only if the dir exists; need to create it otherwise)

" Share vim's clipboard with the OS clipboard - this enable copy-paste between vim and the OS
set clipboard+=unnamedplus

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
call plug#begin()

Plug 'unblevable/quick-scope'

Plug 'drewtempelmeyer/palenight.vim'
" Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ervandew/supertab'

Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'

Plug 'simnalamburt/vim-mundo'
Plug 'luochen1990/rainbow'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'


" Keep this at the last
Plug 'ryanoasis/vim-devicons'
call plug#end()





" Plugin specific rules

" **********************************************************
" quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" **********************************************************

" **********************************************************
" Theme
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1
" **********************************************************

" vim-airline
let g:airline_theme = "palenight"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1

"***********************************************************
" vim-gitgutter
" Turn on line highlighting by default
let g:gitgutter_highlight_lines = 0
" Turn on line number highlighting by default
let g:gitgutter_highlight_linenrs = 1
"***********************************************************

"***********************************************************
" fzf
" Empty value to disable preview window altogether
" let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"***********************************************************

"***********************************************************
" vim-bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
"***********************************************************

"***********************************************************
" rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"***********************************************************


"***********************************************************
" NERDTree
" autocmd vimenter * NERDTree " Disabling this owing to vim-startify handling the start screen
"***********************************************************







" TODO
" 1. Configure vim-obsession with airline -> display the current session on Airline (https://github.com/vim-airline/vim-airline#fine-tuned-configuration and https://dockyard.com/blog/2019/06/25/simple-vim-session-management-part-2)