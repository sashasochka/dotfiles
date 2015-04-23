set nocompatible

filetype plugin indent on
syntax enable
filetype off
filetype on

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" smart is better than dumb
set smartindent

" who likes 8-space tabs?!
set tabstop=4
set shiftwidth=4

" enable mouse
set mouse=a

" Enable line numbers
set number

" enable highlighting of search results
" set hlsearch

" allow backspacing over everything
set backspace=indent,eol,start

" set nowrite backup

" Enable project-specific settings (put configuration file '.vimrc' in a
" toplevel project directory
set exrc
set secure

" Highlight right column
highlight ColorColumn ctermbg=darkgray
set colorcolumn=120

" show pointer address at the bottom-right
set ruler

" disable additional space after merging lines a and b if a ends in special signs
set nojoinspaces

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

set grepprg=grep\ -nH\ $*

" Use english for spellchecking, but don't spellcheck by default
set spl=en spell
set nospell

" Got backspace?
set backspace=2

" Ignoring case is a fun trick
set ignorecase

" Incremental searching is sexy
set incsearch

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4

set foldmethod=indent
set foldlevel=99

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"Langmap to ukrainian"
set langmap=’йцукенгшщзхїфівапролджєячсмитьбю'ЙЦУКЕHГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" set shell=/bin/bash
" set shellcmdflag=--login

" Makefile
autocmd FileType make setlocal noexpandtab

" Indenting for different languages
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
autocmd Filetype ada setlocal ts=2 sts=2 sw=2
autocmd Filetype adb setlocal ts=2 sts=2 sw=2
autocmd Filetype ads setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scala setlocal ts=2 sts=2 sw=2

" Git commits:
autocmd Filetype gitcommit setlocal spell textwidth=72

" Remain selection after (un)indenting
vnoremap < <gv
vnoremap > >gv

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

inoremap jk <Esc>
inoremap ол <Esc>

" Unindent on shift tab
nnoremap <S-Tab> <S-v><

" Copy all file
nnoremap <F4> ggVG"+y<C-O><C-O>
inoremap <F4> <ESC>ggVG"+y<C-O><C-O>a
" Discard everything in insert mode and execute in normal mode (if forgot about insert mode)
" inoremap <F2> <ESC>u@.

inoremap {<CR> {<C-o>o}<C-o>O

" Additional after this post:
" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
nore ; :
nore : ;
nore Ж :
