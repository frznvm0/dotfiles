filetype plugin indent on
syntax on

" Leader
let mapleader = ","

" Basic options
set nocompatible
set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set number
set ruler
set backspace=indent,eol,start
set laststatus=2
set scrolloff=20
set autowrite
set backup
set directory=~/.vim/backup
set backupdir=~/.vim/backup

" Tabs
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Wrapping
set wrap
set textwidth=76
set formatoptions=qrn1
set colorcolumn=80

" Invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·
noremap <leader>l :set list!<CR>

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc
nnoremap <leader><space> :noh<cr>

" Taglist & NERDTree
noremap <leader>t :TlistToggle<CR>
noremap <leader>n :NERDTree<CR>
noremap <leader>m :NERDTreeClose<CR>

" Help key to ESC
noremap <F1> <ESC>
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Misc keybindings
noremap <leader><tab> :tab sball<CR>
nnoremap <leader>v V`]
nnoremap <leader>q gqip
inoremap jj <ESC>
nnoremap <Tab> %
vnoremap <Tab> %

" Initialize Pathogen
call pathogen#infect()

" Color scheme
colorscheme desert

" Set snipmate tags
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Autocommands
if has("autocmd")

  au BufWritePost .vimrc source $MYVIMRC
  au FocusLost * :wa

  au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,Procfile,config.ru} set ft=ruby
  au FileType make set noex st=8 sts=8 sw=8
  au FileType c set noex st=8 sts=8 sw=8
  au FileType python set st=4 sts=4 sw=4
  au BufRead,BufNewFile *.{md,markdown} set st=4 sts=4 sw=4

endif

