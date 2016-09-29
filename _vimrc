set nocompatible              " be iMproved, required
filetype off                  " required" set the runtime path to include Vundle and initialize

set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('D:/Application/VimPlugins/')
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Vundle Plugin List 
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'leafgarland/typescript-vim' 
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on


" Vim Settings
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
syntax on
set number        " always show line numbers 
set cursorline    " highlight line where cursor is on
set ruler         " show line and character number at bottom right
set nowrap        " don't wrap lines 
set tabstop=4     " a tab is 4 spaces 
set backspace=indent,eol,start                     " allow backspacing over everything in insert mode 
set autoindent    " always set autoindenting on 
set copyindent    " copy the previous indentation on autoindenting 
set shiftwidth=4  " number of spaces to use for autoindenting 
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>' 
set showmatch     " set show matching parenthesis 
set ignorecase    " ignore case when searching 
set smartcase     " ignore case if search pattern is all lowercase,                     "    case-sensitive otherwise 
set smarttab      " insert tabs on the start of a line according to                     "    shiftwidth, not tabstop 
set hlsearch      " highlight search terms set incsearch     " show search matches as you type
set synmaxcol=128
syntax sync minlines=256

" Key Bindings
nnoremap <Space> :
