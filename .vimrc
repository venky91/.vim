" Editing - - - - {{{

set nocompatible    " no compatibility with vi
set history=200		" keep 200 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set showmatch       " show matching brackets when typing
set backspace=indent,eol,start 
"allow backspacing over everything in insert mode
set timeout timeoutlen=400 ttimeoutlen=50
" less wait-time in terminal escape sequences
set clipboard^=unnamed
" set the clipboard for tmux copy/paste integration
" - - - - }}}

" Searching - - - - {{{

set hlsearch        " highlight searches
set smartcase       " becomes case sensitive for uppercase 
set incsearch		" do incremental searching
set ignorecase      " case insensitive searching 

" - - - - }}}

" Tabs - - - - {{{

set expandtab       " turns a tab into spaces
set autoindent		" always set autoindenting on
set shiftwidth=4    " spaces for auto-indents
set tabstop=4       " number of spaces a tab counts for
set smarttab

" - - - - }}}

" Files - - - - {{{

set filetype=on
filetype plugin on
filetype indent on
set hidden          " hides buffers instead of removing them
set nobackup		" do not keep a backup file, use versions instead
set autoread        " Set to auto read when a file is changed from the outside
"set autochdir       " automatically cd to file
set noswapfile      " sets no swap file
au InsertEnter * :checktime
" reloads file on insert 
set wildignore=*.o,*.obj,*.bak,*.exe,*.m3u,*.avi,*.mp3,*.jpg,*.srt,*.sub,*.idx,*.nfo,*.mp4,*.sfv,*.mkv,*.rar,*.zip,*.smi,*.ssa,*.divx,*.style,*.nzb,*.chf,*.part,*.png,*.pdf,*.chm
" extensions to ignore

" - - - - }}}

" Appearance - - - - {{{ 

syntax on           " Syntax on
set t_Co=256        " sets 256 colors in the terminal
set cursorline      " Highlights the current line
set number          " Sets the line number
set relativenumber  " Sets number relatively

au WinEnter * :setlocal relativenumber
au WinLeave * :setlocal norelativenumber

" Remove Scroll Bars
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has('mac')
    set guifont=Consolas:h12
    set shell=/bin/bash
    " sets the color scheme based on time
    if strftime("%H") < 4
        set background=dark
        colorscheme navajo-night
    elseif strftime("%H") < 12
        set background=dark
        colorscheme jellybeans
    elseif strftime("%H") < 17
        set background=light
        colorscheme molokai
    elseif strftime("%H") < 21
        set background=dark
        let g:solarized_termtrans = 1
        colorscheme solarized
    else
        set background=dark
        colorscheme badwolf

    endif
elseif has('win32')
    set guifont=Consolas:h10
    " sets the color scheme based on time
    if strftime("%H") < 4
        set background=dark
        colorscheme darkspectrum
    elseif strftime("%H") < 12
        set background=light
        colorscheme solarized
    elseif strftime("%H") < 17
        set background=light
        colorscheme maroloccio
    elseif strftime("%H") < 21
        set background=dark
        colorscheme zenburn
    else
        set background=dark
        colorscheme candycode
    endif
elseif has('unix')
    " Only remove the toolbar in Linux
    set guioptions-=T  "remove toolbar
    set guioptions-=m  "remove top bar
    set gfn=Terminus\ 10
    set shell=/bin/bash
    " sets the color scheme based on time
    if strftime("%H") < 4
        set background=dark
        colorscheme candycode
    elseif strftime("%H") < 12
        set background=dark
        colorscheme bclear
    elseif strftime("%H") < 17
        set background=light
        colorscheme earendel
    elseif strftime("%H") < 21
        set background=dark
        colorscheme molokai
    else
        set background=dark
        colorscheme jellybeans
    endif
endif

" - - - - }}}

" Control Keys - - - - {{

inoremap <C-BS> <C-W>
nnoremap <C-BS> bdw
" ctrl-backspace deleted the previous word
"inoremap <C-\> <C-x><C-l> " pick a different binding
" line completion with ctrl-\
vnoremap <C-a> ggVG
" map ctrl+a to select all in visual mode
nnoremap <C-a> ggVG
" map ctrl+a to select all in normal mode
vnoremap <C-c> "+y
" map ctrl+c to copy in visual mode
vnoremap <C-v> "+gP
" map ctrl+v to paste in visual mode
inoremap <C-v> <C-O>"+gP
" map ctrl+v to paste in insert mode
inoremap <C-U> <C-G>u<C-U>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
nnoremap <C-n> :bn<CR>
" Moves along buffers
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" Maps the control + movement keys to moving around window splits
nnoremap <C-p> :A<CR>
" switch between header and source files
nnoremap <C-\> :pop<cr>
" Pop back to previous definition

" - - - - }}} 
"

" Regular Keys - - - -  {{{ 
nnoremap ; :
vnoremap ; :
" Use ; to do ex commands
cmap Q :q!<cr>
" easier way to quit
cmap w!! w !sudo dd of=%<cr>
" root authority writing
vnoremap <F2> zf
" Creates Folds
map <F2> za
" Opens or closes Folds 
map <F3> zR
" Opens all Folds
map <F4> zM
" Closes all Folds
map <F5> :set paste<CR>
map <F6> :set nopaste<CR>
imap <F5> <C-O>:set paste<CR>
imap <F6> <nop>
set pastetoggle=<F6>
" Pasting
map <F7> :sign unplace *<CR>
" Remove signs on the left side
nnoremap Y y$
" y$ yanks to the end of the line
nnoremap D d$
" d$ deletes to the end of the line
nnoremap C c$
" c$ changes to the end of the line
imap jk <Esc>
" esc returns to command mode
nnoremap Q gq
" Don't use Ex mode, use Q for formatting
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k
" Moves 10 lines down/up
map H ^
" Moves to the front of the line
map L $
" Moves to the end of the line
vnoremap < <gv
vnoremap > >gv
" Reselect text after identing

" - - - - }}}


" Leader - - - - {{{ 

let mapleader=","
" change the mapleader from \ to ,
map <leader>t :TagbarToggle<CR>
" toggles the tagbar with tt
nnoremap <leader><space> :noh<cr>
" map ,space to clear search results
nnoremap <leader>q <C-w><C-v><C-w>l :e ~/scratch.vim<cr>
" opens a pad to do macro testing
nnoremap <leader>Q :so ~/scratch.vim<cr>
" source the macro file
"nnoremap <leader>v <C-w><C-v><C-w>l:e $MYVIMRC<cr>
nnoremap <leader>v :e ~/.vimrc<cr>
" open vimrc in another split
nnoremap <leader>V :silent! so $MYVIMRC<cr>
" source vimrc
nnoremap <leader>hp :!pasty %<cr>
" cats the current file into hastebin
nnoremap <leader>dp :!cp % ~/Dropbox/Public/
" copies current file into dropbox
nnoremap <leader>wv :vsplit<cr>
nnoremap <leader>wh :split<cr>
" vertical/horizontal splits
nnoremap <leader>j :Java<cr>
" eclim mappings
nnoremap <leader>n :NERDTreeToggle<cr> 
" Toggles NerdTree
nnoremap <leader>k :BD<CR>
" Delete Buffer 
nnoremap <leader>] <C-]>
nnoremap<leader>[ :pop<cr>
" Indent the whole file and return to original position
nnoremap <leader>= mzgg=G`z
" Edit file, starting in same directory as current file
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" - - - - }}}

" Folding - - - - {{{ 

set foldenable      " Turn on folding
au FileType vim set foldmethod=marker

au FileType python set foldmethod=indent 
au FileType python set foldnestmax=1

au FileType cpp set foldmethod=syntax
au FileType cpp set foldnestmax=1

au FileType java set foldmethod=syntax

" saves and loads folds from previous sessions
au BufWinLeave * silent! mkview 
au BufWinEnter * silent! loadview

"  - - - - }}}
"

" Language - - - - {{{ 

" general
nnoremap <leader>mc :make <bar> :cw<cr>
" compiles c++ with -g flag
nnoremap <leader>mk :make %< <bar> :cw<cr>
" maps ,m to compile and open a quickfix window if there are errors

" c++ 
nnoremap <C-c> :!./%<<cr>
" runs c++ files *ctrl-c*
nnoremap <leader>cl :!clang++ % -o %<
" clang compiler for c++

if has('mac')
    nnoremap <leader>p :!/usr/bin/python %
    set ofu=syntaxcomplete#Complete
" windows
elseif has ("win32")
    set makeprg=mingw32-make
    set shell=C:\MinGW\msys\1.0\bin/bash.exe
    " executes python under windows
    map <C-p> :!C:\Python27/python %
elseif has('unix')
    " python 
    nnoremap <leader>p2 :!/usr/bin/env python2 %
    " runs python 2 files *ctrl-p*
    nnoremap <leader>p3 :!/usr/bin/env python3 %<cr>
endif

" - - - - }}} 

" WebDev - - - - {{{

"Indentation
autocmd FileType ruby,javascript,html,css,php set autoindent
autocmd FileType ruby,javascript,html,css,php set shiftwidth=2
autocmd FileType javascript,html,css,php set tabstop=2
autocmd FileType javascript,html,css,php set sts=2
autocmd FileType javascript,css,php set textwidth=79

"Enable autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Set the filetype for use with Sparkup
autocmd BufNewFile,BufRead *.xml,*.tpl set ft=html

" }}}

" Plugins - - - - {{{ 

set rtp+=vim/,~/.vim/bundle/vundle/,/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" Vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Rip-Rip/clang_complete'
Bundle 'ervandew/supertab'
Bundle 'shemerey/vim-peepopen'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/LustyExplorer'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/ScrollColors'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-easytags'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/cocoa.vim'
Bundle 'danro/rename.vim'
Bundle 'wincent/Command-T'
Bundle 'vim-scripts/CSApprox'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-repeat'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-rooter'

" Powerline
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'fancy'
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" TagBar
let g:tagbar_left=0
let g:tagbar_width=25
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_sort=0

" mouse
if has('mouse')
    set mouse=a
endif

" Sparkup 
let g:sparkupNextMapping='<c-u>'

" CommandT
map <C-t> :CommandT<cr>
map <C-b> :CommandTBuffer<cr>
nnoremap<leader>ctf :CommandTFlush<cr>
let g:CommandTMaxFiles=10000
let g:CommandTMaxDepth=5
let g:CommandTScanDotDirectories=1
let g:CommandTMaxHeight=20
let g:CommandTMaxCachedDirectories=2
let g:CommandTCancelMap=['<C-x>', '<C-c>']

" Lusty Explorer
nnoremap <leader>f :LustyFilesystemExplorer<cr>
nnoremap <leader>b :LustyBufferExplorer<cr>
nnoremap <leader>g :LustyBufferGrep<cr>

" NerdTree
" Close Vim if only NerdTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDChristmasTree=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows=1
let g:NERDTreeCasadeOpenSingleChildDir=1
let g:NERDTreeAutoDeleteBuffer=1

" Eclim
let g:EclimMenus = 1

" Easytags
let g:easytags_include_members = 1
let g:easytags_python_enabled = 1

" - - - - }}}

" Completion - - - - {{{

" AutoComplPop
let g:acp_behaviorJavaEclimLength = 2
function MeetsForJavaEclim(context)
  return g:acp_behaviorJavaEclimLength >= 0 &&
        \ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
endfunction
let g:acp_behavior = {
    \ 'java': [{
      \ 'command': "\<c-x>\<c-u>",
      \ 'completefunc' : 'eclim#java#complete#CodeComplete',
      \ 'meets'        : 'MeetsForJavaEclim',
    \ }]
  \ }

" Super Tab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

" Clang Complete
let g:clang_complete_auto=1
let g:clang_auto_select=1
let g:clang_user_options='|| exit 0'
let g:clang_use_library=1
set completeopt=menu,menuone,longest

" Tag Location
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Build Tags of your own project with Control-F12.
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" }}}




