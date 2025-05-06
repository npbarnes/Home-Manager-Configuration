" This is Vim, not Vi
set nocompatible

" Turn on syntax highlighting
syntax on

" Enable mouse support in console
" Normally, I would use :set mouse=a, but for some reason copy/paste works
" better with :set mouse=r.
"set mouse=a
set mouse=r

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Spaces are better than tabs
set expandtab
set smarttab

" set the search scan to wrap lines when top or bottom is reached
set wrapscan

" set the search scan so that it ignore case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Tabstops are 4 spaces by default (may be overridden by filetype rules)
set tabstop=4
set shiftwidth=4

" Turn on hidden buffers
set hidden

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

" Incrementally match the search.
set incsearch

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set noshowmode

" When the page starts to scroll, keep the cursor 2 lines from the top and 2
" lines from the bottom
set scrolloff=2

" Enable line numbering
set number

" Move cursor by screen lines, not hard lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Move around split windows with [Ctrl] + h || j || k || l
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Make Y behave like other capitals
nnoremap Y y$

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" use English for spell checking, but don't spell check by default
if version >= 700
	set spl=en spell
	set nospell
endif

" When searching, center on the line that is found
map N Nzz
map n nzz

" Folding Stuffs
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=99
nnoremap <space> za

" No error bells
set noerrorbells

" Turn off highlight search
set nohlsearch

" Plugins (Use :PlugInstall to install and PlugUpdate to update plugins)
" Automatically install vim-plug if it isn't already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" List plugins here
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'npbarnes/bufpos'
Plug 'LnL7/vim-nix'
call plug#end()

" Configure plugins here:
" Airline
" Don't forget to install powerline fonts (github:powerline/fonts)
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Setup bufpos shortcuts
" Mappings to access buffers don't use "\p" because a
" delay before pressing "p" would accidentally paste.
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer in position 1/2/3 etc
" \z       : close current buffer
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>z :bd<CR>
nnoremap <Leader>1 :call BufPos_ActivateBuffer(1)<CR>
nnoremap <Leader>2 :call BufPos_ActivateBuffer(2)<CR>
nnoremap <Leader>3 :call BufPos_ActivateBuffer(3)<CR>
nnoremap <Leader>4 :call BufPos_ActivateBuffer(4)<CR>
nnoremap <Leader>5 :call BufPos_ActivateBuffer(5)<CR>
nnoremap <Leader>6 :call BufPos_ActivateBuffer(6)<CR>
nnoremap <Leader>7 :call BufPos_ActivateBuffer(7)<CR>
nnoremap <Leader>8 :call BufPos_ActivateBuffer(8)<CR>
nnoremap <Leader>9 :call BufPos_ActivateBuffer(9)<CR>
nnoremap <Leader>0 :call BufPos_ActivateBuffer(10)<CR>

autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

