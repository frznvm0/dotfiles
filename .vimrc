" https://github.com/vim/vim/raw/master/runtime/defaults.vim
" https://www.guckes.net/vim/setup.html
" https://github.com/tpope/vim-sensible
" https://www.rogin.xyz/blog/sensible-neovim
" https://github.com/jeffkreeftmeijer/neovim-sensible
" https://www.hillelwayne.com/post/intermediate-vim/
" https://stackoverflow.com/a/35039575
" https://shapeshed.com/vim-netrw/

set is ai ar sta hid scs ic nu ttimeout
set bs=2 ls=2 enc=utf-8 nf-=octal ttm=50 path+=** lcs+=tab:>\ ,trail:-,nbsp:+

if &compatible
  set nocompatible
endif

" run if no +eval (vim.tiny)
silent! while 0
  set nocompatible
  finish
silent! endwhile

set ru wmnu sc si udf udir=/tmp/

if has('nvim')
  set icm=nosplit
else
  filetype plugin indent on
  syntax on
endif

" jump to the last known cursor position
augroup vimStartup
  au!
  au BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_preview=1
let g:netrw_winsize=25
let g:netrw_altv=1

