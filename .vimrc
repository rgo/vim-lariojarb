runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

syntax on
filetype plugin indent on

augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Monaco:h16 guioptions-=T columns=120 lines=70 number
augroup END

" Load our vim settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" Load our vim plugins
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles.local'))
endif


set nocompatible
syntax on
filetype plugin indent on
set encoding=utf-8
set mouse=a
set ruler           " show line and column number of the cursor position
set number          " always show line numbers
"set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2       " a tab is 2 spaces
set softtabstop=2   " Spaces tat tab counts while editing
set expandtab       " convert tab in spaces
set shiftwidth=2    " number of space to use on autoindenting
set autoread        " read file again if it was changed outside of vim
set incsearch       " show search matches as you type
"set hlsearch        " highlight search terms
set hidden          " Let me open new files without save changes
set backspace=indent,eol,start " Normal behaviour of backspace key

" Set terminal to 256 colors
" set t_Co=256
" Textmate scheme colors clone
" colorscheme vividchalk
" colorscheme vibrantink
" colorscheme herald

" don't keep backup after close
set nobackup
" do keep a backup while working
set writebackup
" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Set tag files
set tags=tags,./tags,tmp/tags,./tmp/tags

" Additional Ruby Syntax Highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
" RDOC Syntax Highlighting
autocmd BufRead,BufNewFile *.rd,*.rdoc     set filetype=rdoc

" Uses jquery syntax file to javascript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Default browser - Ubuntu
command -bar -nargs=1 OpenURL :!x-www-browser <args> 2>&1 >/dev/null &
" Default browser - Mac OS X
" command -bar -nargs=1 OpenURL :!open <args> 2>&1 >/dev/null &


" Set minium window size
set wmh=0

" Mapeamos las teclas + y - para que nos maximice o minimice la ventana actual
if bufwinnr(1)
  map + <C-W>_
  map - <C-W>=
endif


" Move between tabs
" Note: tabnext = gt AND tabprevious = gT
" nnoremap <c-n> <esc>:tabnext<CR>
" nnoremap <c-p> <esc>:tabprevious<CR>
" nnoremap <silent> <C-t> :tabnew<CR>
" tip 199 (comments) - Open actual buffer in a tab and then close
nmap t% <C-W>T
nmap td :tabclose<CR>
nmap tn :tabnew<CR>


" Paste from X clipboard to vim
" Commented to use Visual blocks
vnoremap <C-C> "+y
"noremap <C-V> <ESC>"+gP
inoremap <C-V> <ESC>"+gPi


"  move text and rehighlight -- vim tip_id=224
"vnoremap > ><CR>gv
"vnoremap < <<CR>gv
" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv


" A really status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
if &statusline == ''
  set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
end
set laststatus=2


" Toggle paste mode
nmap <silent> <F2> :set invpaste<CR>:set paste?<CR>
" Toggle Highlight search - deprecated now I use :nohl
"nmap <silent> <F3> :set invhls<CR>:set hls?<CR>
" Toggle List
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <F3> :set invlist<CR>:set list?<CR>
" set text wrapping toggles
nmap <silent> <F4> :set invwrap<CR>:set wrap?<CR>


" ACK integration
" set grepprg=ack-grep
" set grepformat=%f:%l:%m
let g:ackprg="ack-grep -H --nocolor --nogroup --column"


" Ruby omnicompletion [help ft-ruby-omni]
" defined in .vim/plugins/hashrocket.vim already
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
" autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Recommendations from http://items.sjbach.com/319/configuring-vim-right "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to mark line and column
nnoremap ' `
" Jump to mark line
nnoremap ` '

" Keep a longer history
set history=100

" Use case-smart searching
set ignorecase
set smartcase

" Set terminal title
set title

" Maintain more context around the cursor
set scrolloff=3
set sidescrolloff=5

" When a bracket is insert, briefly jump to the matching one.
set showmatch
" Show command in the last line of the screen
set showcmd

" Make file/command completion useful
" Show a wildmenu when try to find a command or file
" set wildmenu
set wildmode=longest:full,full

" Read on comments:
" set diffopt+=iwhite             " ignore whitespace in diff mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree                                                      "
" Don't need presentation                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :NERDTreeToggle<CR>
let NERDTreeWinPos='right'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist                                                       "
" I cann't live without Taglist :)                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>
" Split to the right side of the screen
let g:Tlist_Use_Left_Window = 1
" Set the window width
let g:Tlist_WinWidth = 24
" Sort by the order
let g:Tlist_Sort_Type = "name"
" Do not display the help info
let g:Tlist_Compact_Format = 1
" If you are the last, kill yourself
let g:Tlist_Exit_OnlyWindow = 1
" Do not close tags for other files
let g:Tlist_File_Fold_Auto_Close = 1
" Do not show folding tree
let g:Tlist_Enable_Fold_Column = 0
" Always display one file tags
let g:Tlist_Show_One_File = 1




"""""""""""""""""""""""""""""""""""""""""""""""""""
" Matchit                                         "
" Load matchit (% to bounce from do to end, etc.) "
"""""""""""""""""""""""""""""""""""""""""""""""""""
runtime! plugin/matchit.vim
runtime! macros/matchit.vim


""""""""""""""""""""""""""""""""""""""""""""""""""
" allml                                          "
" Provide maps for editing tags                  "
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:allml_global_maps = 1


""""""""""""""""""""""""""""""""""""""""""""""""""
" gist                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_browser_command = 'x-www-browser %URL%'

