filetype indent on

syntax enable

highlight LineNr ctermfg=Grey
highlight EndOfBuffer ctermfg=White

set backspace=indent,eol,start

set clipboard=unnamed

set number
set ruler
set scrolloff=2

set incsearch
set ignorecase
set smartcase

set showmatch
set matchtime=0

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

set complete-=i

noremap j gj
noremap k gk

noremap gr gT

nnoremap gb :bp<CR>
nnoremap gn :bn<CR>

noremap q <ESC>
noremap J j
noremap K k

imap jk <ESC>

autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist
autocmd FileType text,markdown,gitcommit setlocal spell

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
