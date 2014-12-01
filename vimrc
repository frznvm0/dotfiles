" -------------------------------------
" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0ng/vim-hybrid'

" Vundle end
call vundle#end()
filetype plugin indent on
syntax on

" -------------------------------------
" Basic options
set encoding=utf-8
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
set splitright
set fcs=vert:│,fold:-

" Saving
set autowrite
set nobackup
set directory=/tmp

" Tabs
set autoindent
set expandtab
set smarttab
set tabstop=8
set softtabstop=2
set shiftwidth=2

" Wrapping
set wrap
set linebreak
set formatoptions=cqrj
set colorcolumn=80

" Invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·

" Searching
set ignorecase
set smartcase
set hlsearch

" Cmdline completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc

" Folding
set foldignore=
set foldlevelstart=99
set foldmethod=marker

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

" -------------------------------------
" Leader key
let mapleader = ","

" Color
set t_Co=256
color hybrid

" Airline
let g:airline_theme = "badwolf"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" -------------------------------------
" Toggle invisible chars
map <leader>l :set list!<CR>

" Clear search highlight
nmap <leader><space> :noh<CR>

" Select up to last insertion
nmap <leader>v V`]

" Format paragraph
nmap <leader>q gqip

" Y consistent with C and D
map Y y$

" Better indentation
vmap > >gv
vmap < <gv

" Jump to next brace
nmap <Tab> %
vmap <Tab> %

" Window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-c> <C-w>c

" Buffers
nmap <C-tab> :bnext<CR>

" Help key to ESC
map <F1> <ESC>
nmap <F1> <ESC>
imap <F1> <ESC>
vmap <F1> <ESC>

" -------------------------------------
" Autocommands
if has("autocmd")
  " Write if focus lost
  au FocusLost * :wa

  " Handle markdown extensions
  au BufRead,BufNewFile *.{md,mkd,mdown,markdown} set ft=markdown

  " Proper indentation
  au FileType make,c setl noet sts=0 sw=8
  au FileType python,markdown setl sts=4 sw=4

  " Markdown text formatting
  au FileType markdown setl fo+=an fo-=t spell textwidth=80
endif

