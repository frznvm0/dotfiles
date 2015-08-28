" Vundle "{{{
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
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tommcdo/vim-exchange'

" Vundle end
call vundle#end()
filetype plugin indent on
syntax on

"}}}
" Basic options "{{{
set hidden
set number
set visualbell
set backspace=indent,eol,start
set scrolloff=999
set laststatus=2
set noshowmode
set showcmd

" Splits
set splitright
set fillchars=vert:│,fold:―

" Saving
set autowrite
set directory=/tmp

" Tabs
set autoindent
set expandtab
set smarttab
set tabstop=8
set softtabstop=2
set shiftwidth=2

" Text format
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

" Omnifunc for YouCompleteMe
set omnifunc=syntaxcomplete#Complete

" Folding
set foldlevelstart=99
set foldmethod=marker

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

"}}}
" Leader key "{{{
let mapleader = ","

" Color
set t_Co=256
color hybrid

" Airline
let g:airline_theme = "badwolf"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<C-tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-q>"

"}}}
" Toggle invisible chars "{{{
map <silent> <leader>l :set list!<CR>

" Clear search highlight
nmap <silent> <leader><space> :noh<CR>

" Source vimrc
nmap <leader>u :source ~/.vimrc<CR>:echo 'Sourced vimrc'<CR>

" Source selection
vmap <leader>S y:execute @@<CR>:echo 'Sourced selection'<CR>

" Save file as root
cmap w!! %!sudo tee > /dev/null %

" Y consistent with C and D
map Y y$

" Better indentation
vmap > >gv
vmap < <gv

" Window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-c> <C-w>c

" Help key to ESC
map <F1> <ESC>
imap <F1> <ESC>

"}}}
" Autocommands "{{{
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

"}}}
