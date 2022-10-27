set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " syntax highlighting
colorscheme codedark

set encoding=utf8
try
   lang en_US
catch
endtry

set ffs=unix,dos,mac " default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=2 " always keep at least 2 lines of context when scrolling
set wildmenu " turn on WiLd menu
set ruler " always show current position
set cmdheight=1 " the commandbar height
set hid " hide abandon buffers in order to not lose undo history.
set backspace=eol,start,indent " set backspace config
set whichwrap+=<,>,h,l
set ignorecase " ignore case when searching
set smartcase " unless my search term has caps, then turn on case sensitivity
set hlsearch " highlight search term
set incsearch " start searching while typing
set nolazyredraw " don't redraw while executing macros
set magic " set magic on, for regular expressions
set showmatch " show matching brackets when cursor is over them
set mat=2 " How many tenths of a second to blink
set number " show line numbers

" flash on error
set visualbell

" how long to wait between keystrokes before trying to map it to a command
" if i have ,d and ,dv then after i type ,d vim will wait timeoutlen before executing ,d
" I type shortcuC
set timeoutlen=200

" Sets how many lines of history VIM has to remember
set history=700

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change the mapleader from \ to ,
let mapleader=","
let g:mapleader = ","

" switch ; and :
map ; :
noremap ;; ;

" switch ` and '
nnoremap ' `
nnoremap ` '

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
"Persistent undo
try
  set undodir=~/.vim/undodir
  set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
autocmd FileType html,xhtml,xml,css,ts,js setlocal shiftwidth=2 tabstop=2

set lbr
set tw=500 " text width

set cindent " c indent
set si "Smart indet
set wrap "Wrap lines

" change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>v :vsp<CR>
set splitright " vsplit to the right by default

" Smart way to move btw. windows
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map space to / (search)
map <space> /
" Stop highlighting search term
map <silent> <leader><cr> :noh<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Moving through buffers
map <C-j> :bp<cr>
map <C-k> :bn<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ Line:\ %l/%L:%c\ %{fugitive#statusline()}
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Line:\ %l/%L:%c

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" Plugins
if !exists('$GIT_EXEC_PATH')
    call plug#begin('~/.vim/plugged')

    Plug 'git@github.com:junegunn/fzf.git'
    map <C-p> :FZF<cr>

    Plug 'git@github.com:w0rp/ale.git'
    let g:ale_set_highlights = 0
    let g:ale_sign_error ='>'
    let g:ale_sign_warning ='~'

    Plug 'git@github.com:scrooloose/nerdtree.git'
    map <silent> <C-n> :NERDTreeToggle<CR>

    Plug 'git@github.com:leafgarland/typescript-vim.git'

    Plug 'ap/vim-buftabline'

    call plug#end()
endif

