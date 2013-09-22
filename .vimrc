" PACKAGES {{{

set nocompatible    " no compatibility with vi
filetype off        " required for vundle

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'vim-scripts/ScrollColors'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'paradigm/TextObjectify'
NeoBundle 'godlygeek/tabular'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'powerman/vim-plugin-viewdoc'
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive' }
NeoBundle 'SirVer/ultisnips'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'wincent/Command-T'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tomtom/tcomment_vim'

NeoBundleLazy 'shemerey/vim-peepopen', {
\'autoload' : { 'mappings' : ['<Plug>(PeepOpen)',] },}

NeoBundle 'Raimondi/delimitMate'

NeoBundleLazy 'tpope/vim-endwise', {
\'autoload' : { 'insert' : 1, },}

NeoBundleLazy 'mbbill/undotree', {
\'autoload' : {'commands' : 'UndotreeToggle' },}

NeoBundleLazy 'scrooloose/nerdtree', {
\'augroup' : 'NERDTree',
\'autoload' : {'commands' : 'NERDTreeToggle' },}

NeoBundleLazy 'majutsushi/tagbar', {
\'autoload' : {'commands' : 'TagbarToggle' },}

NeoBundleLazy 'scrooloose/syntastic', {
\'autoload' : {'filetypes' : ['html', 'javascript', 'php', 'java', 'css', 'xml', 'json', 'cpp', 'h', 'haskell'], },}

NeoBundleLazy 'Twinside/vim-haskellFold', {
\'autoload' : {'filetypes' : ['hs', 'haskell'], },}

NeoBundleLazy 'vim-scripts/Haskell-Conceal', {
\'autoload' : {'filetypes' : ['hs', 'haskell'], },}

NeoBundleLazy 'ujihisa/neco-ghc', {
\'autoload' : {'filetypes' : ['hs', 'haskell'], },}

NeoBundleLazy 'eagletmt/ghcmod-vim', {
\'autoload' : {'filetypes' : ['hs', 'haskell'], },}

NeoBundleLazy 'tpope/vim-rails', {
\'autoload' : {'filetypes' : ['ruby', 'rails'], },}

NeoBundleLazy 'klen/python-mode', {
\'autoload' : { 'filetypes' : ['python',], },}

NeoBundleLazy 'vim-scripts/a.vim', {
\ 'autoload' : { 'filetypes' : ['c', 'cpp', 'h', 'm', 'objcpp', 'objc' ], },}

NeoBundleLazy 'marijnh/tern_for_vim', {
\'autoload' : {'filetypes' : ['javascript', ], },}

NeoBundleLazy 'mattn/emmet-vim/', {
\'autoload' : {'filetypes' : ['html', 'js', 'css', 'xml'], },}

NeoBundleLazy 'jakar/vim-json', {
\'autoload' : {'filetypes' : ['javascript', 'css', 'xml', 'json'], },}

NeoBundle 'bling/vim-airline'
NeoBundle 'oblitum/rainbow'

"NeoBundleLazy 'tpope/vim-bundler', {
"\'autoload' : {'filetypes' : ['ruby', 'rails'], },}

"NeoBundleLazy 'pangloss/vim-javascript', {
"\'autoload' : {'filetypes' : ['html', 'javascript', 'css', 'xml'], },}

"NeoBundleLazy 'jelera/vim-javascript-syntax', {
"\'autoload' : {'filetypes' : ['html', 'javascript',], },}

"NeoBundleLazy 'vim-ruby/vim-ruby', {
"\'autoload' : {'filetypes' : ['ruby', 'rails'], },}

"NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'wavded/vim-stylus'

filetype plugin indent on

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Installation check.
NeoBundleCheck

" Disable some of the a.vim mappings.
augroup DisableMappings
    " Alternate
    autocmd!
    autocmd FileType c,cpp nnoremap <Leader>ihn <nop>
    autocmd FileType c,cpp nnoremap <Leader>is <nop>
    autocmd FileType c,cpp nnoremap <Leader>ih <nop>
    autocmd FileType objc let g:alternateExtensions_h = "m" 
    autocmd FileType objc let g:alternateExtensions_m = "h"
augroup END

" }}}

" EDITING {{{

set backspace=indent,eol,start " backspacing
set notimeout ttimeout timeoutlen=50 " less wait in term
set history=200     " keep 200 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set showmatch       " show matching brackets while typing
set noerrorbells    " don't ring the bell
set lazyredraw      " don't redraw during macros
set scrolloff=5     " 5 lines will always appear below the cursor
set ttyfast         " indicate a fast term
set hlsearch        " highlight searches
set ignorecase      " case insensitive searching
set smartcase       " case sensitive for uppercase
set incsearch       " incremental searching
set expandtab       " turns a tab into a space
set autoindent      " always set indent on
set tabstop=4       " number of spaces a tab counts for
set smarttab        " intelligent tabbing
set shiftwidth=4    " all for 4
set sts=4           " about indenting
set diffopt=iwhite  " ignore white space in diffs
set undofile        " persistent undo even after exiting a file
set undodir=~/.vim/undo

autocmd FileType * setlocal formatoptions-=cro " Disable automatic comments.

" Mouse
if has('mouse')
    set mouse=a
    set ttymouse=xterm2
endif

" }}}

" FILES {{{

set hidden          " hides buffers instead of removing them
set nobackup        " don't keep a backup file
set autoread        " refreshes file constantly
set noswapfile      " sets no swap file

" Ignore these files.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.nzb,*.chf,*.part 
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.style,*.png
set wildignore+=*.o,*.obj,*.bak,*.m3u,*.avi,*.ssa,*.pdf
set wildignore+=*.sub,*.mp3,*.jpg,*.srt,*.idx,*.smi,*.chm
set wildignore+=*.nfo,*.mp4,*.sfv,*.mkv,*.rar,*.zip,*.class

" emulates autoread in the terminal
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
    endif
augroup END

" Read Man Pages in vim with :Main.
runtime! ftplugin/man.vim

" }}}

" THEME {{{

syntax on           " Color files automatically.
set cursorline      " Highlight the current line.

if v:version >= 704
    set number
    set relativenumber
    au WinEnter * :setlocal relativenumber
    au WinEnter * :setlocal number
    set regexpengine=1 " Old Regex Engine
else
    set relativenumber  " Numbers are not absolute.
endif

au WinEnter * :setlocal relativenumber
au WinLeave * :setlocal norelativenumber

set guioptions-=r  " Remove right-hand scrollbar.
set guioptions-=L  " Remove left-hand scrollbar.
set showbreak=↪    " Prettier linewraps.

if has('mac')
    set guifont=Consolas:h12,Menlo:h12
    set shell=/bin/bash
    set clipboard^=unnamed  " Tmux copy paste integration.
elseif has('win32')
    set guifont=Consolas:h10
elseif has('unix')
    set t_Co=256       " Sets 256 colors in the terminal.
    set guioptions-=T  " Remove Toolbar.
    set guioptions-=m  " Remove Menubar.
    set gfn=Inconsolata\ for\ Powerline\ 12,Terminus\ 10
    set shell=/bin/bash
endif

set background=dark

if has('gui_running')
    if strftime("%H") < 4
        colorscheme fruity
    elseif strftime("%H") < 8
        colorscheme hybrid
    elseif strftime("%H") < 12
        colorscheme solarized
    elseif strftime("%H") < 16
        colorscheme molokai
    elseif strftime("%H") < 20
        colorscheme luna
    else
        colorscheme badwolf
    endif
else
    if strftime("%H") < 4
        colorscheme molokai
    elseif strftime("%H") < 8
        colorscheme candycode
    elseif strftime("%H") < 12
        colorscheme xoria256
    elseif strftime("%H") < 16
        colorscheme fruity
        hi StatusLine guibg=red
    elseif strftime("%H") < 20
        colorscheme hybrid
    else
        colorscheme badwolf
    endif
endif

hi SignColumn guibg=black

" Status line
set laststatus=2
set statusline=%t%m%r%w\ \%{tagbar#currenttag('[%s]','')}\ \ \%=
set statusline+=\ [%l,%v][%p%%]\ (%{&ff})%y\ %{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%*

" }}}

" KEYMAPS {{{

" Modifier
inoremap <C-U> <C-G>u<C-U>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" Maps the control + movement keys to moving around window splits.
nnoremap <C-\> :pop<cr>
" Pop back to previous definition.

" Regular
noremap ; :
vnoremap ; :
" Use ; to do ex commands.
cmap Q :qa!<cr>
" easier way to quit
cmap w!! w !sudo dd of=%<cr>
" root authority writing
vnoremap <F2> zf
" Creates Folds.
map <F2> za
" Opens or closes Folds .
map <F3> zR
" Opens all Folds.
map <F4> zM
" Closes all Folds.
nnoremap <F8> :UndotreeToggle<CR>
map <F9> :sign unplace *<CR>
" Remove signs on the left side.
nnoremap Y y$
" y$ yanks to the end of the line.
nnoremap D d$
" d$ deletes to the end of the line.
nnoremap C c$
" c$ changes to the end of the line.
imap jk <Esc>
" esc returns to command mode.
nnoremap Q gq
" Don't use Ex mode, use Q for formatting.
vnoremap < <gv
vnoremap > >gv
" Reselect text after identing
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
" Double Click with the Mouse selects all occurences in the buffer.
:com! -nargs=1 -complete=help H h <args> <bar> only
" Use :H to open a help file in a full buffer.
nnoremap ' `
nnoremap ` '
" Closer way to get to where you were last.
nnoremap <TAB> za

" Leader
let mapleader=","
let maplocalleader=" "
" change the mapLeader from \ to ,
nnoremap <Leader>t :TagbarToggle<CR>
" toggles the tagbar with tt
nnoremap <Leader><space> :noh<cr>
" map ,space to clear search results
nnoremap <Leader>q <C-w><C-v><C-w>l :e ~/scratch.vim<cr>
" opens a pad to do macro testing
nnoremap <Leader>Q :so ~/scratch.vim<cr>
" source the macro file
nnoremap <Leader>v :e ~/.vimrc<cr>
" open vimrc in another split
nnoremap <Leader>V :silent! so $MYVIMRC<CR>
" source vimrc
nnoremap <Leader>wv :vsplit<cr>
nnoremap <Leader>wh :split<cr>
" vertical/horizontal splits
nnoremap <Leader>n :NERDTreeToggle<cr>
" Toggles NerdTree
nnoremap <Leader>= mzgg=G`z
" Indent the whole file and return to original position
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Edit file, starting in same directory as current file
vnoremap <Leader>v "_dP
" Delete into one register and paste from another.
nnoremap <Leader>je :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
" YouCompleteMe GoTos
" Easy Motion Forward and Backwards

" }}}

" FOLDING {{{

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

set foldenable      " Turn on folding
"set foldcolumn=1    " Add a column to the left for folding.
au FileType vim set foldmethod=marker
au FileType txt set foldmethod=marker

au FileType python set foldmethod=indent
au FileType c,cpp,java,ruby,php,css,html,eruby,javascript set foldmethod=syntax
au FileType python,c,cpp,java,ruby,php,css,html,eruby,javascript set foldlevel=4

" Saves cursor position from last time.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

"}}}

" BUILD & COMPILE {{{

" Use make in the same directory.
autocmd FileType c,cpp cabbrev make call UseMakeSameDirForC()<CR><CR>

" Default Make
nnoremap <Leader>mc :make <bar> :cw<cr>
" Compile the current file and open a quickfix on errors.
nnoremap <Leader>mk :make %< <bar> :cw<cr>
" Regular compile with no quickfix.
nnoremap <Leader>mm :make %< <cr>
" Compile SDL programs.
nnoremap <Leader>ms :!g++ % -o %< `sdl-config --cflags --libs`
" Compile > Run > Back to Code, for SDL programs.
nnoremap <Leader>mr :!g++ % -o %< `sdl-config --cflags --libs` -lSDL_image -lSDL_ttf -lSDL_mixer && ./%< <cr><cr>

" C/C++
" These won't run properly if there's a file to be opened since they would be opening files from the directory vim was launched from.
autocmd FileType c,cpp nnoremap <C-c> :!./%<<cr>
" runs c++ files *ctrl-c*
autocmd FileType c,cpp nnoremap <f5> :!g++ % -o %< && ./%< <cr><cr>
autocmd FileType c,cpp nnoremap <f6> :!g++ % -o %< `sdl-config --cflags --libs` -lSDL_image -lSDL_ttf -lSDL_mixer && ./%< <cr><cr>
autocmd FileType c,cpp nnoremap <f7> :!g++ % -o %< `sdl-config --cflags --libs` -lSDL_image -lSDL_ttf -lSDL_mixer && ./%< <cr>

" Java
autocmd FileType java nnoremap <C-c> :!java %<<cr><cr>
autocmd FileType java set makeprg=javac\ %
autocmd FileType java set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd FileType java nnoremap <f5> :make<cr><cr>
autocmd FileType java nnoremap <f6> :!echo %\|awk -F. '{print $1}'\|xargs java<cr><cr>

" Shell
autocmd FileType sh nnoremap <C-c> :!./%<CR>
autocmd FileType ruby nnoremap <C-c> :!ruby %<CR>

" Python
if has('mac')
    autocmd FileType python nnoremap <C-c> :!/usr/local/bin/python %<cr>
    " option to use :pyfile % instead
    set ofu=syntaxcomplete#Complete
" windows
elseif has ("win32")
    set makeprg=mingw32-make
    set shell=C:\MinGW\msys\1.0\bin/bash.exe
    " executes python under windows
    autocmd FileType python map <C-p> :!C:\Python27/python %
elseif has('unix')
    " python
    autocmd FileType python nnoremap <Leader>p2 :!/usr/bin/env python2 %
    " runs python 2 files *ctrl-p*
    autocmd FileType python nnoremap <Leader>p3 :!/usr/bin/env python3 %<cr>
endif

" }}}

" WEB {{{

"Indentation
autocmd FileType javascript,eruby,ruby,html,css,php set shiftwidth=2
autocmd FileType javascript,eruby,ruby,html,css,php set tabstop=2
autocmd FileType javascript,eruby,ruby,html,css,php set sts=2
autocmd FileType javascript,eruby,ruby,css,php,python set textwidth=79

" Set the filetype for use with Sparkup
autocmd BufNewFile,BufRead *.xml,*.tpl set ft=html

" HTML in php files.
au BufRead,BufNewFile *.php set ft=php.html

if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif
" }}}

" PLUGIN {{{

" Airline
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 0

" CommandT
nnoremap <C-p> :CommandT<cr>
nnoremap <C-s-b> :CommandTBuffer<cr>
nnoremap <Leader>ctf :CommandTFlush<cr>
let g:CommandTMaxFiles=10000
let g:CommandTMaxDepth=6
let g:CommandTScanDotDirectories=1
let g:CommandTMaxHeight=20
let g:CommandTMaxCachedDirectories=5
let g:CommandTCancelMap=['<C-x>', '<C-c>']

" CtrlP
"nnoremap <Leader>g :CtrlPCurFile<CR>
"nnoremap <Leader>f :CtrlP<CR>
"nnoremap <Leader>b :CtrlPBuffer<CR>
"nnoremap <Leader>r :CtrlPMRU<CR>
"let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
"let g:ctrlp_max_depth = 10 " How many levels to search through.
"let g:ctrlp_mruf_max = 30 " How many files to remember.
"let g:ctrlp_by_filename=0 " Emphasize directories in search.
"let g:ctrlp_use_caching=1 " Cache searches.
"let g:ctrlp_clear_cache_on_exit = 0 " Share cache between sessions.
"let g:ctrlp_cache_dir = $HOME.'/.vim/.cache/ctrlp'
"let g:ctrlp_max_files = 10000
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Easy Motion
"let g:EasyMotion_leader_key = '<space>'

" Easytags
let g:easytags_include_members = 1
let g:easytags_python_enabled = 1
let g:easytags_file = '~/.vim/tags/easytags'
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_updatetime_warn = 0

" Eclim
let g:EclimMenus = 1
let g:EclimCompletionMethod = 'omnifunc'

" Fugitive
nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" GHC Mod
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

"" Haskell Mode
"au BufEnter *.hs compiler ghc
"let g:haddock_browser="/Applications/Firefox.app/Contents/MacOS/firefox"

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" NerdTree
" Close Vim if only NerdTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDChristmasTree=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=0
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows=0
let g:NERDTreeCasadeOpenSingleChildDir=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowLineNumbers=1

" Python Mode
let g:pymode_breakpoint = 1 " Load breakpoints plugin.
let g:pymode_doc_key = '<Leader>K'
let g:pymode_run_key = '<Leader>R'
let g:pymode_breakpoint_key = '<Leader>B' " Key for set/unset breakpoint.
let g:pymode_rope = 0 " Use Jedi instead of Rope.
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_lint_mccabe_complexity = 16

" Rainbow Parens
let g:rainbow_active = 1

" Sparkup
" let g:sparkupNextMapping='<c-u>'

" Signify
let g:signify_mapping_next_hunk = '<nop>'
let g:signify_mapping_prev_hunk = '<nop>'
let g:signify_mapping_toggle_highlight = '<nop>'
let g:signify_mapping_toggle = '<nop>'

" Syntastic
let g:syntastic_check_on_open        = 1 " run syntastic on open and save
let g:syntastic_enable_balloons      = 1 " display errors in tool tips
let g:syntastic_enable_highlighting  = 1 " mark errors with syntax highlighting
let g:syntastic_auto_jump            = 0 " jump to the first error on save
let g:syntastic_auto_loc_list        = 2 " open and close automatically
let g:syntastic_enable_signs         = 1 " errors to the left
let g:syntastic_error_symbol         = "✗"
let g:syntastic_warning_symbol       = "⚠"
let g:syntastic_style_error_symbol   = "s✗"
let g:syntastic_style_warning_symbol = "s⚠"
let g:syntastic_mode_map             = { 'passive_filetypes': ['java', 'cpp', 'c', 'python'] }

" Tabular
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a" :Tabularize /"<CR>
vnoremap <Leader>a" :Tabularize /"<CR>

" TagBar
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_sort=0

" Tcomment
" Yank visual selected lines before toggling comment.
vmap gy ygvgc
" Yank and paste visually selected liens before toggling comments.
vmap gyy ygvgc'>gp'.
" Yank line before toggling comment.
nmap gy yygcc
" Yank and paste line before toggling comment and remember position.
" Use :t-1 instead of yyP to preserve registers.
nmap gyy mz:t-1<cr>gCc`zmz

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnippets","UltiSnips"]
let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"


" View Doc
let g:viewdoc_open='new'
let g:viewdoc_only=1

" Vim Rooter
"let g:rooter_use_lcd = 1

" YouCompleteMe
autocmd VimEnter * call FindYouCompleteMeConf()
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {
  \ 'c' : ['->', '.'],
  \ 'objc' : ['->', '.'],
  \ 'ocaml' : ['.', '#'],
  \ 'cpp,objcpp' : ['->', '.', '::'],
  \ 'perl' : ['->'],
  \ 'php' : ['->', '::'],
  \ 'cs,css,haskell,java,javascript,d,ruby' : ['.'],
  \ 'python,perl6,scala,vb,elixir,go' : ['.'],
  \ 'lua' : ['.', ':'],
  \ 'erlang' : [':'],
  \ }


function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction


au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" }}}

" UNITE {{{
let g:unite_source_menu_menus = {}
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]

map [menu]u :Unite menu<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

augroup UniteAutoCmd
    autocmd!
augroup END

function! s:unite_tabs_and_windows()
    nmap <buffer> <C-h> <C-w>h
    nmap <buffer> <C-j> <C-w>j
    nmap <buffer> <C-k> <C-w>k
    nmap <buffer> <C-l> <C-w>l
    imap <buffer> <C-h> <Esc><C-w>h
    imap <buffer> <C-j> <Esc><C-w>j
    imap <buffer> <C-k> <Esc><C-w>k
    imap <buffer> <C-l> <Esc><C-w>l
    nmap <buffer> <leader>x :bd!<CR>
    nmap <buffer> <C-s> <Plug>(unite_redraw)
    imap <buffer> <C-s> <Plug>(unite_redraw)
endfunction

let g:unite_source_process_enable_confirm = 1
let g:unite_source_history_yank_enable = 1
let g:unite_enable_split_vertically = 0
let g:unite_winheight = 10
let g:unite_source_directory_mru_limit = 300
let g:unite_source_file_mru_limit = 300
let g:unite_source_file_mru_filename_format = ':~:.'

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_rec_max_cache_files=4000
let g:unite_split_rule="botright"
let g:unite_prompt='» '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'
    let g:unite_source_grep_recursive_opt=''
endif

function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> jk <Plug>(unite_insert_leave)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    imap <buffer> <leader> <Esc><leader>
    nmap <buffer> <C-s> <Plug>(unite_redraw)
    imap <buffer> <C-s> <Plug>(unite_redraw)
    call s:unite_tabs_and_windows()
endfunction

autocmd FileType unite call s:unite_settings()

nnoremap <silent> [menu], :<C-u>Unite -buffer-name=files buffer file_mru bookmark file_rec/async<cr>
nnoremap <silent> [menu]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [menu]/ :<C-u>Unite -buffer-name=search grep:.<cr>
nnoremap <silent> [menu]b :<C-u>Unite buffer -buffer-name=buffers -start-insert<CR>
nnoremap <silent> [menu]f :<C-u>Unite file_rec/async<CR>
nnoremap <silent> [menu]r :<C-u>Unite file_mru<CR>
nnoremap <silent> [menu]ma
    \ :<C-u>Unite mapping<CR>
nnoremap <silent> [menu]me
    \ :<C-u>Unite output:message<CR>
nnoremap [menu]? :<C-u>Unite source<CR>

" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

" files and dirs menu {{{
let g:unite_source_menu_menus.files = {
    \ 'description' : ' files & dirs
        \ ⌘ [space]o',
    \}
let g:unite_source_menu_menus.files.command_candidates = [
    \['▷ open file ⌘',
        \'Unite -start-insert file'],
    \['▷ open more recently used files ⌘ [space] r',
        \'Unite file_mru'],
    \['▷ open file with recursive search ⌘',
        \'Unite -start-insert file_rec/async'],
    \['▷ edit new file',
        \'Unite file/new'],
    \['▷ search directory',
        \'Unite directory'],
    \['▷ search recently used directories',
        \'Unite directory_mru'],
    \['▷ search directory with recursive search',
        \'Unite directory_rec/async'],
    \['▷ make new directory',
        \'Unite directory/new'],
    \['▷ change working directory',
        \'Unite -default-action=lcd directory'],
    \['▷ know current working directory',
        \'Unite output:pwd'],
    \['▷ command-t files  ⌘ <c-p>',
        \'CommandT'],
    \['▷ command-t buffers  ⌘ <c-b>',
        \'CommandTBuffer'],
    \['▷ command-t flush  ⌘ ',
        \'CommandTFlush'],
    \]
nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
            \ menu:files<CR>
" }}}

" yanks, registers & history menu {{{
let g:unite_source_menu_menus.registers = {
    \ 'description' : ' yanks, registers & history
        \ ⌘ [space]i',
    \}
let g:unite_source_menu_menus.registers.command_candidates = [
    \['▷ yanks ⌘ ,i',
        \'Unite history/yank'],
    \['▷ commands (history) ⌘ q:',
        \'Unite history/command'],
    \['▷ searches (history) ⌘ q/',
        \'Unite history/search'],
    \['▷ registers',
        \'Unite register'],
    \['▷ messages',
        \'Unite output:messages'],
    \['▷ undo tree (undotree) ⌘ <F8>',
        \'UndotreeToggle'],
    \]
nnoremap <silent>[menu]i :Unite -silent menu:registers<CR>
" }}}

" neobundle menu {{{
let g:unite_source_menu_menus.neobundle = {
    \ 'description' : ' plugins administration with neobundle
        \ ⌘ [space]n',
    \}
let g:unite_source_menu_menus.neobundle.command_candidates = [
    \['▷ neobundle',
        \'Unite neobundle'],
    \['▷ neobundle log',
        \'Unite neobundle/log'],
    \['▷ neobundle lazy',
        \'Unite neobundle/lazy'],
    \['▷ neobundle update',
        \'Unite neobundle/update'],
    \['▷ neobundle search',
        \'Unite neobundle/search'],
    \['▷ neobundle install',
        \'Unite neobundle/install'],
    \['▷ neobundle check',
        \'Unite -no-empty output:NeoBundleCheck'],
    \['▷ neobundle docs',
        \'Unite output:NeoBundleDocs'],
    \['▷ neobundle clean',
        \'NeoBundleClean'],
    \['▷ neobundle list',
        \'Unite output:NeoBundleList'],
    \['▷ neobundle direct edit',
        \'NeoBundleDirectEdit'],
    \]
nnoremap <silent>[menu]n :Unite -silent -start-insert menu:neobundle<CR>
" }}}

" git menu {{{
let g:unite_source_menu_menus.git = {
    \ 'description' : ' admin git repositories
        \ ⌘ [space]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git viewer (gitv) ⌘ ,gv',
        \'normal ,gv'],
    \['▷ git viewer - buffer (gitv) ⌘ ,gV',
        \'normal ,gV'],
    \['▷ git status (fugitive) ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff (fugitive) ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit (fugitive) ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log (fugitive) ⌘ ,gl',
        \'exe "silent Glog | Unite -no-quit quickfix"'],
    \['▷ git log - all (fugitive) ⌘ ,gL',
        \'exe "silent Glog -all | Unite -no-quit quickfix"'],
    \['▷ git blame (fugitive) ⌘ ,gb',
        \'Gblame'],
    \['▷ git add/stage (fugitive) ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout (fugitive) ⌘ ,go',
        \'Gread'],
    \['▷ git rm (fugitive) ⌘ ,gR',
        \'Gremove'],
    \['▷ git mv (fugitive) ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push (fugitive, buffer output) ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull (fugitive, buffer output) ⌘ ,gP',
        \'Git! pull'],
    \['▷ git command (fugitive, buffer output) ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git edit (fugitive) ⌘ ,gE',
        \'exe "command Gedit " input(":Gedit ")'],
    \['▷ git grep (fugitive) ⌘ ,gg',
        \'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
    \['▷ git grep - messages (fugitive) ⌘ ,ggm',
        \'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git grep - text (fugitive) ⌘ ,ggt',
        \'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git init ⌘ ,gn',
        \'Unite output:echo\ system("git\ init")'],
    \['▷ git cd (fugitive)',
        \'Gcd'],
    \['▷ git lcd (fugitive)',
        \'Glcd'],
    \['▷ git browse (fugitive) ⌘ ,gB',
        \'Gbrowse'],
    \['▷ github dashboard (github-dashboard) ⌘ ,gD',
        \'exe "GHD! " input("Username: ")'],
    \['▷ github activity (github-dashboard) ⌘ ,gA',
        \'exe "GHA! " input("Username or repository: ")'],
    \['▷ github issues & PR ⌘ ,gS',
        \'normal ,gS'],
    \]

nnoremap <silent>[menu]g :Unite -silent -winheight=29 -start-insert menu:git<CR>
" }}}

" vim menu {{{
let g:unite_source_menu_menus.vim = {
    \ 'description' : ' vim
        \ ⌘ [space]v',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷ choose colorscheme',
        \'Unite colorscheme -auto-preview'],
    \['▷ mappings',
        \'Unite mapping -start-insert'],
    \['▷ edit configuration file (vimrc)',
        \'edit $MYVIMRC'],
    \['▷ choose filetype',
        \'Unite -start-insert filetype'],
    \['▷ vim help',
        \'Unite -start-insert help'],
    \['▷ vim commands',
        \'Unite -start-insert command'],
    \['▷ vim functions',
        \'Unite -start-insert function'],
    \['▷ vim runtimepath',
        \'Unite -start-insert runtimepath'],
    \['▷ vim command output',
        \'Unite output'],
    \['▷ unite sources',
        \'Unite source'],
    \['▷ kill process',
        \'Unite -default-action=sigkill -start-insert process'],
    \['▷ launch executable (dmenu like)',
        \'Unite -start-insert launcher'],
    \]
nnoremap <silent>[menu]v :Unite menu:vim -silent -start-insert<CR>
" }}}

" }}}

" COMPLETION {{{

" Various
set omnifunc=syntaxcomplete#Complete " Default Completion
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd FileType haskell set omnifunc=necoghc#omnifunc

set completeopt=menuone

" Tags
set tags+=~/.vim/tags/cpp_src
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/easytags

" }}}

" FUNCTIONS {{{

" CD to current file's directory, execute make there and then cd back to Root.
function! UseMakeSameDirForC()
    redir => rootPath
        pwd
    redir end
    lcd %:p:h
    make
    cd `=rootPath`
endfunction

function! FindYouCompleteMeConf()
    if &ft == 'c'
        let g:ycm_global_ycm_extra_conf = "~/.vim/.c/ycm_extra_conf.py" 
    elseif &ft == 'objcpp' || &ft == 'objc'
        let g:ycm_global_ycm_extra_conf = "~/.vim/.obj/ycm_extra_conf.py"
    else  
        let g:ycm_global_ycm_extra_conf = "~/.vim/.cpp/ycm_extra_conf.py"
    endif
endfunction

" }}}
