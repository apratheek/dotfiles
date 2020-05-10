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
" function! Tabline()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     let tab = i + 1
"     let winnr = tabpagewinnr(tab)
"     let buflist = tabpagebuflist(tab)
"     let bufnr = buflist[winnr - 1]
"     let bufname = bufname(bufnr)
"     let bufmodified = getbufvar(bufnr, "&mod")

"     let s .= '%' . tab . 'T'
"     let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
"     let s .= ' ' . tab .':'
"     let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

"     if bufmodified
"       let s .= '[+] '
"     endif
"   endfor

"   let s .= '%#TabLineFill#'
"   if (exists("g:tablineclosebutton"))
"     let s .= '%=%999XX'
"   endif
"   return s
" endfunction
" set tabline=%!Tabline()


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
" set list
" set listchars=tab:▸\ ,eol:¬,trail:•,extends:#,nbsp:.
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Clear previous search highlight on click of escape
nnoremap <esc> :noh<return><esc>


" Spell check
iabbrev teh the

" Plugins here
call plug#begin()

Plug 'unblevable/quick-scope'

" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'
Plug 'MattesGroeger/vim-bookmarks'

Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'

Plug 'simnalamburt/vim-mundo'
Plug 'luochen1990/rainbow'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" CoC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Loading a specific commit since newer commits fail with gopls
Plug 'neoclide/coc.nvim', { 'commit': '030aef2f6d', 'do': 'yarn install --frozen-lockfile' }

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'


" Highlight words that are similar to the word under the cursor
" Plug 'dominikduda/vim_current_word'
" Plug 'rrethy/vim-illuminate'
Plug 'mrded/vim-hi-cursor-words'

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
colorscheme codedark
" let g:palenight_terminal_italics=1
" **********************************************************

" vim-airline
let g:airline_theme = "codedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1 " Show tab number
let g:airline_powerline_fonts = 1

"***********************************************************
" vim-gitgutter
" Turn on line highlighting by default
let g:gitgutter_highlight_lines = 1
" Turn on line number highlighting by default
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_set_sign_backgrounds = 1
"***********************************************************

"***********************************************************
" fzf
" Empty value to disable preview window altogether
" let g:fzf_preview_window = ''

" Use ripgrep for searching -> will ignore files with entries in .gitignore
let $FZF_DEFAULT_COMMAND = 'rg --files'
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

" Use Ctrl+ to search for files using FZF
nnoremap <C-p> :<C-u>FZF<CR>
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
" vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
"***********************************************************

"***********************************************************
" vim-go plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
"***********************************************************

"***********************************************************
" NERDTree
" autocmd vimenter * NERDTree " Disabling this owing to vim-startify handling the start screen
"***********************************************************

"***********************************************************
" coc.nvim

" Store the required coc plugins

let g:coc_global_extensions = [
\ 'coc-tsserver', 
\ 'coc-eslint', 
\ 'coc-yaml', 
\ 'coc-json', 
\ 'coc-css', 
\ 'coc-highlight', 
\ 'coc-html', 
\ 'coc-yank', 
\ 'coc-flutter', 
\ 'coc-python'
\ ]

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"***********************************************************

" TODO
" 1. Configure vim-obsession with airline -> display the current session on Airline (https://github.com/vim-airline/vim-airline#fine-tuned-configuration and https://dockyard.com/blog/2019/06/25/simple-vim-session-management-part-2)
