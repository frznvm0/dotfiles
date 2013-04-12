set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Bundle 'Shougo/neocomplcache'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
syntax on

" Global variables
let mapleader = ","
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

" Basic options
set encoding=utf-8
set autoindent
set showcmd
set hidden
set number
set ruler
set vb t_vb=
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set scrolloff=999
set omnifunc=syntaxcomplete#Complete
set autowrite
set nobackup
set directory=/tmp

" Tabs
set expandtab
set smarttab
set tabstop=8 softtabstop=2 shiftwidth=2

" Wrapping
set wrap linebreak
set textwidth=76
set formatoptions=cqrj
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
nmap <leader>v V`]
nmap <leader>q gqip
nmap <Tab> %
vmap <Tab> %

" Easier completion in Insert mode
imap <Tab> <C-n>

" Color scheme
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
call togglebg#map("<F5>")

" Autocommands
if has("autocmd")

  au BufWritePost .vimrc source $MYVIMRC
  au FocusLost * :wa

  au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,*.ru} set ft=ruby
  au BufRead,BufNewFile *.{md,mkd,mdown,markdown} set ft=markdown
  au FileType make,c setlocal noet sts=0 sw=8
  au FileType python,markdown setlocal sts=4 sw=4
  au FileType markdown setlocal formatoptions+=an

endif

