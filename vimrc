filetype plugin indent on
syntax on

" Leader
let mapleader = ","

" Basic options
set nocompatible
set encoding=utf-8
set autoindent
set showcmd
set hidden
set number
set ruler
set vb t_vb=
set backspace=indent,eol,start
set laststatus=2
set scrolloff=999
set foldmethod=syntax
set omnifunc=syntaxcomplete#Complete
set autowrite
set nobackup
set directory=/tmp

" Tabs
set ts=2 sts=2 sw=2 et
set smarttab

" Wrapping
set wrap linebreak
set textwidth=76
set formatoptions=ctq
set colorcolumn=80

" Invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·
map <leader>l :set list!<CR>

" Searching
set ignorecase smartcase
set hlsearch
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc
nmap <leader><space> :noh<CR>

" Taglist & NERDTree
map <leader>t :TlistToggle<CR>
map <leader>n :NERDTree<CR>
map <leader>m :NERDTreeClose<CR>

" Clipboard
map <leader>y "*y
map <leader>yy "*Y
map <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

" Help key to ESC
map <F1> <ESC>
nmap <F1> <ESC>
imap <F1> <ESC>
vmap <F1> <ESC>

" Window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-c> <C-w>c

" Misc keybindings
map <leader><Tab> :tab sball<CR>
nmap <leader>v V`]
nmap <leader>q gqip
nmap <Tab> %
vmap <Tab> %

" Initialize Pathogen
call pathogen#infect()
call pathogen#helptags()

" Color scheme
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
call togglebg#map("<F5>")

" Display current branch in statusline
set statusline="%{fugitive#statusline()}"

" Set snipmate tags
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Completion
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:SuperTabDefaultCompletionType = "context"

" Autocommands
if has("autocmd")

  au BufWritePost .vimrc source $MYVIMRC
  au FocusLost * :wa

  au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,*.ru} set ft=ruby
  au FileType make,c setlocal ts=8 sts=8 sw=8 noet
  au FileType python,markdown setlocal ts=4 sts=4 sw=4

endif

