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
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tommcdo/vim-exchange'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kovisoft/paredit'
Plugin 'wavded/vim-stylus'

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
set fillchars+=vert:│

" Saving
set autowrite
set directory=/tmp

" Tabs
set autoindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=2
set shiftwidth=2

" Text format
set linebreak
set formatoptions=cqj
set colorcolumn=80

" Invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·
let &showbreak = '↪ '

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

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

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

"}}}
" Toggle invisible chars "{{{
map <silent> <leader>l :set list!<CR>

" Clear search highlight
nmap <silent> <leader><space> :noh<CR>

" Source vimrc
nmap <leader>u :source ~/.vimrc<CR>:echo 'Sourced vimrc'<CR>

" %% expands to directory of current file
cmap %% <C-r>=expand('%:h').'/'<CR>

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

" UltiSnips
imap <C-e> <silent> <C-o>:call UltiSnips#ExpandSnippet()
imap <C-n> <silent> <C-o>:call UltiSnips#JumpForwards()
imap <C-p> <silent> <C-o>:call UltiSnips#JumpBackwards()

" Help key to ESC
map <F1> <ESC>
imap <F1> <ESC>

"}}}
" Autocommands "{{{
if has("autocmd")
  " Write if focus lost
  au FocusLost * :wa

  " Remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Detect extensions
  au BufNewFile,BufReadPost *.md set filetype=markdown
  au BufNewFile,BufReadPost *.styl set filetype=stylus

  " Proper indentation
  au FileType make,c,gitconfig setl noexpandtab
  au FileType python,markdown setl softtabstop=4 shiftwidth=4

  " Markdown text formatting
  au FileType markdown setl formatoptions+=tan spell textwidth=80

  " Literate coffeescript
  au FileType litcoffee runtime ftplugin/coffee.vim

  " Rainbow parens
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif

"}}}
