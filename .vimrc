" Clear search input on start
let @/ = "" 

" Keyboard remap for Mac only, here is checking if is a silicon chip.
if system('arch') == "arm64"
    source ~/.vimMacKeys
endif 

" Main mappers
let mapleader = " "
imap jj <esc>

" Basic stuff
syntax enable
syntax on

set smartcase                                               " No ignore case when pattern is uppercase
set scroll=8                                                " Lines to scroll with CTRL-U and CTRL-D
set scrolloff=8                                             " Minimum number of lines above and below the cursor
set visualbell                                              " Use visual bell instead of beeping
set backspace=indent,eol,start                              " Allow backspacing over everything in insert mode
set clipboard=unnamedplus                                   " Use the OS clipboard by default
set hlsearch                                                " Highlight matches with the last search pattern
set incsearch                                               " Show where search pattern typed so far matches
set autoindent smartindent expandtab tabstop=4 shiftwidth=4 " Config indent
set number                                                  " Show numbers then set color
set cursorline                                              " Show highlight current line

" Set colors line highlights
highlight clear CursorLine
highlight LineNr ctermfg=236
highlight CursorLineNR cterm=bold
highlight CursorLine  ctermbg=236 

" Map hide current search highlight
nmap <leader>, :nohlsearch<cr>

" Remap Undo
nmap U <C-R>

" Remap Newline
nmap o o<Esc>
nmap O O<Esc>

" Replace currently selected text with default register
" Without yanking it
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

" Scroll
nnoremap <C-j> <C-e><C-e>
nnoremap <C-k> <C-y><C-y>

" Mappings reserved for Vim/NeoVim
if has('nvim')

    " Remap yank line
    nmap <S-y> yy

    " Duplicate line, withou yanking it
    nnoremap <leader>d :co.<CR>

    " Indent file
    nmap <leader>l gg=G``

    " Edit vimrc
    nmap ,ev :tabedit ~/.vimrc<CR>
    nmap ,eiv :tabedit ~/.ideavimrc<CR>

    " Move lines
    nnoremap <S-A-j> :m+<CR>
    nnoremap <S-A-k> :m-2<CR>
    xnoremap <S-A-j> :m'>+<CR>gv=gv
    xnoremap <S-A-k> :m-2<CR>gv=gv

    " Auto source vimrc when save it
    augroup autosourcing
        autocmd!
        autocmd BufWritePost ~/.vimrc source %
    augroup END

endif
