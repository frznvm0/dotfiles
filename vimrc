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
Bundle 'w0ng/vim-hybrid'

filetype plugin indent on
syntax on

" Leader
let mapleader = ","

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
set autowrite
set nobackup
set directory=/tmp
set splitright
set fcs=vert:│,fold:-

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
map <leader>l :set list!<CR>

" Searching
set ignorecase
set smartcase
set hlsearch
nmap <leader><space> :noh<CR>

" Cmdline completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc

" Folding
set foldignore=
set foldlevelstart=99
set foldmethod=marker

" Color scheme
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid

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

" Multifunctional Tab key
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

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
  au FileType markdown setlocal fo+=an fo-=t spell textwidth=80

endif

" Plugin settings
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

