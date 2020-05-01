" ========================================================================
" Vundle stuff - no clue
" ========================================================================

set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'keith/rspec.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-cucumber'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'godlygeek/tabular'
Plugin 'posva/vim-vue'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jparise/vim-graphql'
Plugin 'tpope/vim-vinegar'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-dotenv'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
map <silent><C-p> :FZF<CR>

" Multicursor ftw
Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-eunuch'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_section_y = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" Airline Tabs
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Theme
let g:airline_theme='minimalist'

" Elixir
Plugin 'elixir-editors/vim-elixir'

" Snippets
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'

" React
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'

let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml,*.jsx,*.js"

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'clojure-emacs/cider-nrepl'

" Elm
Plugin 'ElmCast/elm-vim'
let g:elm_setup_keybindings = 0 " Get the fuck out of my bindings
" Want this, but not showing errors:
" let g:elm_format_autosave = 1

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'

" Nerdtree
Plugin 'scrooloose/nerdtree'
" Open on right
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 1

" Closes vim if only Nerdtree window is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "•",
    \ "Untracked" : "+",
    \ "Renamed"   : "→",
    \ "Unmerged"  : "-",
    \ "Deleted"   : "x",
    \ "Dirty"     : "x",
    \ "Clean"     : "✔",
    \ 'Ignored'   : '-',
    \ "Unknown"   : "?"
    \ }

Plugin 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

Plugin 'dense-analysis/ale'
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = "⚠️"
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

" Folds
" https://github.com/vim-utils/vim-ruby-fold/issues/4
" set foldlevelstart=99
" let g:ruby_fold = 1
" let ruby_foldable_groups = 'def do'
"
" "https://bitbucket.org/sjl/dotfiles/src/8ac890f099a0ca970cd9cc90635264e95cb1a8be/vim/vimrc?at=default&fileviewer=file-view-default
" function! MyFoldText() " {{{
"     let line = getline(v:foldstart)
"
"     let nucolwidth = &fdc + &number * &numberwidth
"     let windowwidth = winwidth(0) - nucolwidth - 3
"     let foldedlinecount = v:foldend - v:foldstart
"
"     " expand tabs into spaces
"     let onetab = strpart('          ', 0, &tabstop)
"     let line = substitute(line, '\t', onetab, 'g')
"
"     let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
"     let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"     return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
" endfunction " }}}
" set foldtext=MyFoldText()

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" For the sake of JS
" ========================================================================
" This sets working dir to the currently open dir. This helps autocomplete file
" names while doing an `import` in JS.
" autocmd BufEnter * silent! lcd %:p:h


" ========================================================================
" Ruby stuff
" ========================================================================
syntax on                 " Enable syntax highlighting

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " Clojure
  autocmd FileType clojure setlocal colorcolumn=80
  autocmd FileType clojure map <Leader>t :!lein test<cr>
augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

let mapleader = ","

imap jj <esc>
map <Leader>b :Gblame<cr>
map <Leader>tw :set textwidth=999<cr>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
vmap <Leader>bed "td?describe<cr>obed<tab><esc>"tpkdd/end<cr>o<esc>:nohl<cr>
map <Leader>cc :!clear && cucumber %<CR>
map <Leader>ct :!cucumber<CR>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co mmggVG"*y`m
" map <Leader>cc :Rjcollection client/
map <Leader>cj :Rjspec client/
map <Leader>n :cn<cr>
map <Leader>p :cp<cr>
map <Leader>cm :Rjmodel client/
map <Leader>cs :call SearchForCallSitesCursor()<CR>
map <Leader>cd :call SearchForRubyMethodDeclarationCursor()<CR>
map <Leader>cf :call SearchForRubyClassCursor()<CR>
nnoremap <silent> <Leader>sa :Ag <C-R><C-W><CR>
map <Leader>g :Gstatus<cr>
map <Leader>s :Ag
map <Leader>ct :Rtemplate client/
map <Leader>cv :Rjview client/
map <Leader>d Obinding.pry<esc>:w<cr>
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>ec :e ~/code/
map <Leader>gw :!git add . && git commit -m 'WIP'<cr>
map <Leader>gl :e Gemfile.lock<cr>
map <Leader>mf mmgqap`m:w<cr>
map <Leader>o :w<cr>:call RunNearestSpec()<CR>
map <Leader>ps :set paste<CR><esc>i
map <Leader>px :set nopaste<CR><esc>
map <Leader>pn :echo 'Use <Leader>px'<cr>
map <Leader>q :copen<cr><cr>
map <Leader>ra :%s/
map <Leader>rd :redraw!<cr>
map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>rt q:?!ruby<cr><cr>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sg :sp<cr>:grep<space>
map <Leader>sj :call OpenJasmineSpecInBrowser()<cr>
map <Leader>sm :RSmodel
map <Leader>sp yss<p>
map <Leader>sn :vsplit ~/.vim/UltiSnips/rails.snippets<CR>
map <Leader>so :so %<cr>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest
map <Leader>sv :RSview
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>y :!rspec --drb %<cr>
map <Leader>u :Runittest<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vf :Vfunctional<cr>
map <Leader>vg :vsp<cr>:grep
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vu :AV<CR>
map <Leader>vm :Vmodel<cr>
map <Leader>vv :Vview<cr>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>
map <Leader>nn :noh<cr>
map <Leader>cl :w<cr>:exe "! clear && cucumber %" . ":" . line(".")<cr>
map <Leader>sc :setlocal spell spelllang=en_us<cr>
map <Leader>ns :set nospell<cr>
map <Leader>mm [<C-d>
map <Leader>c ctagg<cr>
noremap <silent><Leader>l :NERDTreeToggle<CR>
noremap <silent><Leader>a :NERDTreeToggle<CR>
noremap <silent> <leader>f :NERDTreeFind<cr>
vmap <Leader>ab :'<,'>!sort<cr>
vmap <Leader>pt :Prettier<cr>
noremap <Leader>pt :Prettier<cr>
noremap <Leader>at :ALEToggle<cr>
noremap <Leader>ad :ALEDetail<cr>

function! FormatFile()
  normal! mmgg=G`m
endfunction
nnoremap <Leader>ri FormatFile()<esc>:w<cr>

" RSpec let to vars
" Only supports inline let
map <Leader>ta mmdt:xf)xa=<esc>f{x$xx<esc>:w<cr>`m<esc>
" RSpec let to vars
" Only supports one-line block lets
map <Leader>td dt:xf)Da<Space>=<esc>Jjdd<esc>:w<cr>

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Remapping vim and tmux windows
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Open tree of the current file's parent folder
" Example:
"   pwd: /code/my-proj/file.txt
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
" map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
" map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vsplit<cr><C-w><C-w>
map <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <C-h> :nohl<cr>
imap <C-l> :<Space>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
" map <C-x> <C-w>c
map <C-x> <C-w>c

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Quickfix management
map <Space><Space> :ccl<cr>

" Cursor shape
"
" TMUX
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" iTerm 2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Terminal
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber
set number
set textwidth=79
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set lazyredraw " Don't redraw screen when running macros.
set nofixendofline

colorscheme jellybeans
let g:jellybeans_overrides = {
\  'background': { 'guibg': '212121'  },
\}

" Set the tag file search order
" set tags=./tags;
set tags^=./.git/tags;

" Use Silver Searcher instead of grep
set grepprg=ag

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Ignore stuff that can't be opened
set wildignore+=tmp/**

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

set nofoldenable " Say no to code folding...

" Weird issue. Hack for now
set maxmempattern=100000

" Makes `y` and `p` work with global buffers.
set clipboard+=unnamed

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq
command! WQ wq

" Execute macro in q
map Q @q

" Disable K looking stuff up
map K <Nop>

au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  vsplit
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

function! SearchForCallSitesCursor()
  let searchTerm = expand("<cword>")
  call SearchForCallSites(searchTerm)
endfunction

function! SearchForRubyMethodDeclarationCursor()
  let searchTerm = expand("<cword>")
  call SearchForDeclaration(searchTerm)
endfunction

function! SearchForRubyClassCursor()
  let searchTerm = expand("<cword>")
  call SearchForRubyClass(searchTerm)
endfunction

" Search for call sites for term (excluding its definition) and
" load into the quickfix list.
function! SearchForCallSites(term)
  cexpr system('ag -w ' . shellescape(a:term) . '\| grep -v def')
endfunction

function! SearchForDeclaration(term)
  let definition = 'def ' . a:term
  let class_definition = 'def self.' . a:term
  let scope_declaration = 'scope :' . a:term
  let search = definition . '|' . class_definition . '|' . scope_declaration
  " echo search
  cexpr system('ag -w ' . shellescape(search))
endfunction

function! SearchForRubyClass(term)
  let class = 'class ' . a:term
  let module = 'module ' . a:term
  let search = class . '|' . module
  cexpr system('ag -w ' . shellescape(search))
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Now using thoughtbot/vim-rspec
let g:rspec_command = '!clear && bin/rspec {spec}'
let g:dispatch_quickfix_height=25

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" Set gutter background to black
highlight SignColumn ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>r :call RenameFile()<cr>

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

"  Make sure tmux does not overlap vim splits
autocmd VimResized * :wincmd =

" Make it more obviouser when lines are too long
highlight ColorColumn ctermbg=235

command! Path :call EchoPath()
function! EchoPath()
  echo join(split(&path, ','), "\n")
endfunction

" ========================================================================
" End of things set by me.
" ========================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

  augroup END

endif " has("autocmd")
