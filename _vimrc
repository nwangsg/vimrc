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
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on


" Vim Settings
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" syntax causes lag sometimes, turn on according to computer performance
" syntax on
" set synmaxcol=128
" syntax sync minlines=256
syntax off
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

" Custom Bindings 
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :o<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q! :q!<CR>
nnoremap <Leader>rc :e $MYVIMRC<CR>
nnoremap <Leader>rl :so $MYVIMRC<CR>  " reload vimrc
"<leader>ri to reindent
nnoremap <Leader>ri ggvG=
nnoremap <Leader>pu :!git pull<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR><CR>

" NERDCommenter
" Default toggle command <leader>c<Space>
filetype plugin on
let g:NERDSpaceDelims = 1         " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1     " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'   " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1      " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }  " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1   " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1   " Enable trimming of trailing whitespace when uncommenting

" YCM
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>

" CtrlP 
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_extensions = ['buffertag','tag','line','dir']
let g:ctrlp_custom_ignore = {
			\ 'dir': 'v[\/]\.(git)$',
			\'file': '\v\.(exe|dll|swp|zip|tmp)$'
			\}


" Vim-airline 
let g:airline#extensions#tabline#enabled = 1


