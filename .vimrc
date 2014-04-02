" Setup vundle
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vundle'
Bundle 'clang-complete'
Bundle 'Cpp11-Syntax-Support'
Bundle 'vim-coffee-script'
Bundle 'git@github.com:derekwyatt/vim-scala'

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

" Java specific stuff
let java_highlight_all=1
let java_highlight_debug=1

let java_ignore_javadoc=1
let java_highlight_functions=1
let java_mark_braces_in_parens_as_errors=1

" highlight strings inside C comments
let c_comment_strings=1

" set keymap=ukrainian-jcuken
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"Langmap to ukrainian"
set langmap=’йцукенгшщзхїфівапролджєячсмитьбю'ЙЦУКЕHГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" set shell=/bin/bash
" set shellcmdflag=--login

" Makefile
autocmd FileType make setlocal noexpandtab

" Indenting for html and js
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
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

" Compile and run
" clang
nnoremap <F5> :!clear && clang++ -std=c++1y -g -stdlib=libc++ -O2 -pedantic -Wall -Wextra -Weffc++ -fopenmp -o run % && ./run <CR>
" gcc
nnoremap <F6> :!clear && g++ -O2 -pedantic -Wall -g -Wextra -Weffc++ -std=c++11 -fopenmp -o run % && ./run <CR>
nnoremap <F7> :!clear && javac % && java $(echo % <bar> sed 's/\.java//') <CR>
nnoremap <F8> :!clear && ./% <CR>

" Copy all file
nnoremap <F4> ggVG"+y<C-O><C-O>
inoremap <F4> <ESC>ggVG"+y<C-O><C-O>a
" Discard everything in insert mode and execute in normal mode (if forgot about insert mode)
" inoremap <F2> <ESC>u@.

inoremap {<CR> {<C-o>o}<C-o>O

" Additional after this post:
" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
nore ; :
nore Ж :

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

