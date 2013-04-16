" Editing - - - - {{{

set nocompatible    " no compatibility with vi
set history=200		" keep 200 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set showmatch       " show matching brackets when typing
set backspace=indent,eol,start 
"allow backspacing over everything in insert mode
set notimeout ttimeout timeoutlen=50
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

filetype plugin indent on
set hidden          " hides buffers instead of removing them
set nobackup		" do not keep a backup file, use versions instead
set autoread        " Set to auto read when a file is changed from the outside
set noswapfile      " sets no swap file
au InsertEnter * :checktime
" reloads file on insert 
set wildignore=*.o,*.obj,*.bak,*.exe,*.m3u,*.avi,*.mp3,*.jpg,*.srt,*.sub,*.idx,*.nfo,*.mp4,*.sfv,*.mkv,*.rar,*.zip,*.smi,*.ssa,*.divx,*.style,*.nzb,*.chf,*.part,*.png,*.pdf,*.chm
" extensions to ignore

" source vimrc automatically
autocmd BufWritePost .vimrc nested source $MYVIMRC




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
elseif has('win32')
    set guifont=Consolas:h10
elseif has('unix')
    set guioptions-=T  "remove toolbar
    set guioptions-=m  "remove top bar
    set gfn=Terminus\ 10
    set shell=/bin/bash
endif

set background=dark

if has('gui_running')
    if strftime("%H") < 4
        colorscheme molokai
    elseif strftime("%H") < 12
        colorscheme solarized
    elseif strftime("%H") < 17
        colorscheme fruity
    elseif strftime("%H") < 21
        colorscheme hybrid
    else
        colorscheme badwolf
    endif
else 
    if strftime("%H") < 4
        colorscheme railscasts
    elseif strftime("%H") < 12
        colorscheme jellybeans
    elseif strftime("%H") < 17
        colorscheme molokai
    elseif strftime("%H") < 21
        colorscheme fruity
    else
        colorscheme badwolf
    endif
endif


" - - - - }}}

" Control Keys - - - - {{{

inoremap <C-BS> <C-W>
nnoremap <C-BS> bdw
" ctrl-backspace deleted the previous word
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
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" Maps the control + movement keys to moving around window splits
nnoremap <C-\> :pop<cr>
" Pop back to previous definition

" - - - - }}} 

" Regular Keys - - - -  {{{ 
nnoremap ; :
vnoremap ; :
" Use ; to do ex commands
cmap Q :q!<cr>
" easier way to quit
"cmap w!! w !sudo dd of=%<cr>
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
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
" Double Click with the Mouse selects all occurences in the buffer.

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
"nnoremap <leader>V :silent! so $MYVIMRC<cr>
nnoremap <leader>V :silent! so $MYVIMRC<CR>
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
" Neat Select and Replace Short Cuts.
nnoremap <leader>s *N
nnoremap <leader>r :'{,'}s/<c-r>=expand('<cword>')<cr>/
xnoremap <leader>r :s/<c-r>=expand(@/)<cr>/
nnoremap <leader>o *Ncgn

nnoremap <leader>y *N
" - - - - }}}

" Folding - - - - {{{ 

set foldenable      " Turn on folding
au FileType vim set foldmethod=marker
au FileType txt set foldmethod=marker
au FileType php set foldmethod=syntax

au FileType python set foldmethod=indent 
au FileType python set foldnestmax=1

au FileType cpp set foldmethod=syntax
au FileType cpp set foldnestmax=1

au FileType java set foldmethod=syntax

" saves and loads folds from previous sessions
au BufWinLeave * silent! mkview 
au BufWinEnter * silent! loadview

"  - - - - }}}

" Language - - - - {{{ 

" General
nnoremap <leader>mc :make <bar> :cw<cr>
" make
nnoremap <leader>mk :make %< <bar> :cw<cr>
" maps ,m to compile and open a quickfix window if there are errors

" C/C++ 
nnoremap <C-c> :!./%<<cr>
" runs c++ files *ctrl-c*
nnoremap <leader>cl :!clang++ % -o %<
" clang compiler for c++

" Python
if has('mac')
    nnoremap <leader>p :!/usr/local/bin/python %<cr>
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

" Set the filetype for use with Sparkup
autocmd BufNewFile,BufRead *.xml,*.tpl set ft=html

" }}}

" Plugins - - - - {{{ 

set rtp+=vim/,~/.vim/bundle/vundle/,/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" Vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Rip-Rip/clang_complete'
Bundle 'shemerey/vim-peepopen'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/LustyExplorer'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/ScrollColors'
Bundle 'vim-scripts/CSApprox'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'xolox/vim-easytags'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/cocoa.vim'
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-rooter'
Bundle 'airblade/vim-gitgutter'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
Bundle 'dahu/VimRegexTutor'

" DelimitMate
au FileType c,cpp inoremap {      {}<Left>
au FileType c,cpp inoremap {<CR>  {<CR>}<Esc>O
au FileType c,cpp inoremap {{     {
au FileType c,cpp inoremap {}     {}

" Powerline
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'fancy'
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" TagBar
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_sort=0

" mouse
if has('mouse')
    set mouse=a
    set ttymouse=xterm2
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

" Syntastic
let g:syntastic_check_on_open       = 0
let g:syntastic_enable_balloons     = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_auto_jump           = 1
let g:syntastic_auto_loc_list       = 1
let g:syntastic_enable_signs        = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['java', 'cpp', 'c'] }

" - - - - }}}

" Completion - - - - {{{

" Clang Complete
let g:clang_complete_auto=0
let g:clang_auto_select=0
let g:clang_user_options='|| exit 0'
let g:clang_use_library=1
set completeopt=menu,menuone,longest
let g:clang_jumpto_back_key="<C-\>"

" Tag Location
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Various
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Neocomplcache
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Compatibility with Clang
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Neosnippet
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}




