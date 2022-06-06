set number
set tabstop=4
set shiftwidth=4
set expandtab
set cc=120

autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell

" Install vim-plug if not found.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins.
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
 Plug 'tpope/vim-sensible'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'itchyny/lightline.vim'
 Plug 'airblade/vim-gitgutter'

 Plug 'dense-analysis/ale'
 Plug 'jiangmiao/auto-pairs'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'sheerun/vim-polyglot'

 " Distraction free editing.
 Plug 'junegunn/goyo.vim'
 Plug 'junegunn/limelight.vim'
call plug#end()

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <F2> :Goyo 120<CR>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
