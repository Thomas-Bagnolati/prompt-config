" -------------------------------
"          NeoVimConfig           
" -------------------------------

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let @/ = ""                                                 " Clear search input on start
if has('mac')                                               
    source ~/.vimMacKeys                                    " keyboard remap for mac
endif 

" Config ----------------------->
syntax enable
syntax on

set smartcase                                               " No ignore case when pattern is uppercase
set scroll=18                                               " Lines to scroll with CTRL-U and CTRL-D
set scrolloff=8                                             " Minimum number of lines above and below the cursor
set visualbell                                              " Use visual bell instead of beeping
set backspace=indent,eol,start                              " Allow backspacing over everything in insert mode
set clipboard=unnamedplus                                   " Use the OS clipboard by default
set hlsearch                                                " Highlight matches with the last search pattern
set incsearch                                               " Show where search pattern typed so far matches
set autoindent smartindent expandtab tabstop=4 shiftwidth=4 " Config indent
set number                                                  " Show numbers then set color
set cursorline                                              " Show highlight current line
set nowrap                                                  " Don't wrap text
set showmode                                                " Show mode of vim


" Theme ------------------------>
" Set colors line highlights
highlight clear CursorLine
highlight LineNr ctermfg=236
highlight CursorLineNR cterm=bold
highlight CursorLine  ctermbg=236 
highlight Visual  ctermfg=253 
" For NeoVim only
if has('nvim')
    au TextYankPost * silent! lua vim.highlight.on_yank()   " highlight on yank
endif


" Plugins (Vim-Plug) ----------->
call plug#begin('~/.vim/plugged')
Plug 'dhruvasagar/vim-table-mode'                       " Easy create table on vim, use <Leader>tm to run :TableModeToggle
call plug#end()


" MapKeys ---------------------->
let mapleader = " "
imap jj <esc>

" Map hide current search highlight
nmap <leader>, :nohlsearch<cr>

" Remap Undo
nmap U <C-R>

" Remap Newline
nmap o o<Esc>
nmap O O<Esc>

" Paste selected text without yanking it
vnoremap p "_dP

" Delete without yanking
nnoremap d "_d
vnoremap d "_d

" Go to next/previous word
nnoremap <C-h> b
nnoremap <C-l> w
vnoremap <C-h> b
vnoremap <C-l> w
nnoremap <C-S-h> B
nnoremap <C-S-l> W
vnoremap <C-S-h> B
vnoremap <C-S-l> W

" Insert Mode navigation
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Scroll by 5 with new inputs
nnoremap <C-j> 5<C-e>
nnoremap <C-k> 5<C-y>


" MapKeys reserved for not IDEA -->
if !has('ide')

    " File edit fast
    nmap ,ev :vsp ~/.vimrc<CR>
    nmap ,eiv :vsp ~/.ideavimrc<CR>
    nmap ,env :vsp ~/.config/nvim/init.vim<CR>

    " Remap yank line
    nmap <S-y> yy

    " Duplicate line, withou yanking it
    nnoremap <leader>d :co.<CR>

    " Indent file
    nmap <leader>l gg=G``

    " Remap navigation on split
    nmap <A-h> <C-w>h
    nmap <A-j> <C-w>j
    nmap <A-k> <C-w>k
    nmap <A-l> <C-w>l

    " Move lines
    nnoremap <S-A-j> :m+<CR>
    nnoremap <S-A-k> :m-2<CR>
    xnoremap <S-A-j> :m'>+<CR>gv=gv
    xnoremap <S-A-k> :m-2<CR>gv=gv

    " Add/Remove column line indicator
    nmap <leader>cc :set cc=34<CR>
    nmap <leader>cC :set cc=0<CR>
    nmap <leader>cC :set cc=0<CR>

endif


" Auto source file when save it
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source $MYVIMRC
augroup END



"
""
""" Makix - 2023.05.24
