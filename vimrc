set nocompatible        " Use Vim defaults (much better!)
let mapleader=","       " change the leader to be a comma vs slash
filetype off            " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Bundle 'gmarik/vundle'

" Must have plugins!
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
Bundle 'editorconfig-vim'

" Web stuff
Bundle 'pangloss/vim-javascript'
Bundle 'https://github.com/hail2u/vim-css3-syntax.git'
Bundle 'https://github.com/skammer/vim-css-color.git'
Bundle 'groenewege/vim-less'

" Python
Bundle 'python.vim'

" nsf/gocode
Plugin 'nsf/gocode'

" Markdown
Bundle 'https://github.com/tpope/vim-markdown.git'

" Git
Bundle 'https://github.com/tpope/vim-fugitive'

" Color theme
Bundle 'https://github.com/tpope/vim-vividchalk.git'
call vundle#end()

call pathogen#infect()
syntax on
filetype plugin indent on     " required!

filetype on
autocmd FileType go autocmd BufWritePre execute "normal! mz:mkview\<esc>:Fmt\<esc>:loadview\<esc>`z"
" autocmd FileType python map <buffer> <F8> :call Flake8() <CR>
nmap <leader>a <Esc>:Ack!

set t_Co=256            " 256 color mode in term

set autoread            " ReaLoad a file if was changed outside of Vim

set cc=80               " Highlight column at 80
set wrap                " Enable line wrapping.

" Use intelligent case while searching.
" If search string contains an upper case letter, disable ignorecase.
set smartcase
set incsearch           " Incremental search
set hlsearch            " Higlihts search results

" Identation
set autoindent          " Copy indent from current line when starting a new line
set smarttab
set tabstop=4           " Number of space og a <Tab> character
set softtabstop=4
set shiftwidth=4        " Number of spaces use by autoindent
set expandtab           " Pressing <Tab> puts spaces, and < and > for indenting uses psaces

" Commands execute automatically on an event

" Rules to disable expandtab in makefiles and markdown files
autocmd FileType make set noexpandtab nosta
autocmd FileType md set expandtab nosta

autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd! bufwritepost cimrc source ~/.vimrc

" Enables mice in terminal vim
set mouse=a
set mousem=popup        " Enable the popup menu.

set splitright          " Split vertically to the right.
set splitbelow          " Split horizontally below.

set number              " show line number
set ru                  " Ruler active

" Wildmenu
set wildmenu

" Complete options (disable preview scratch window)
" set completeopt=menu,menuone,longest
" Limit popup menu height
" set pumheight=15


" Config Airline and status line
let g:smartusline_string_to_highlight = '(%n) %f '
set laststatus=2                               " Seperate lines for state and mode
let g:airline_powerline_fonts=1                " Powerline simbols. Hermit font support it
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
"let g:airline_left_sep='?'                    " If we use a font without support of powerline simbols
"let g:airline_right_sep=''
set showmode            " Show current mode in the status line.
set showcmd             " Show the command in the status line.

" Try to use hermit font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Hermit\ Medium\ 10
  elseif has("gui_photon")
    set guifont=Hermit:s10
  elseif has("gui_kde")
    set guifont=Hermit/10/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-hermitr-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Hermit:h10:cDEFAULT
  endif
endif

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/'

" vim-go settings
" let g:go_fmt_command = "goimports"
" let g:go_fmt_options="-tabs=false -tabwidth=4"

" Color theme
colors vividchalk
" colo desert

" Enable indent guides on boot and allow colorschemes to style them.
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg='#202020' ctermbg=darkgrey
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#101010'

set ofu=syntaxcomplete#Complete
let g:syntastic_mode_map={ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html', 'cpp'] }
let g:syntastic_check_on_open=1

" Trailing spaces stuff
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Butterfly mode
:command Butterfly :echo "amazing physics is going on"

" Windows fix
" if !has("unix")
"  " backspace and cursor keys wrap to previous/next line
"  set backspace=indent,eol,start whichwrap+=<,>,[,
"endif
set backspace=2

map <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo']
set clipboard=unnamed
set clipboard=unnamedplus
set noshowmatch
let g:pyflakes_use_quickfix = 0

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
