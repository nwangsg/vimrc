set nocompatible              " be iMproved, required
filetype off                  " required" set the runtime path to include Vundle and initialize

" work dir
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('D:/Application/VimPlugins/')

" home dir
" set rtp+=E:/workspace/Vundle.vim
" call vundle#begin('E:/workspace/vimbundles/')

" Vundle Plugin List
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'skwp/greplace.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mhinz/vim-signify'

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
set encoding=utf-8
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
set splitright    " split on the right
set updatetime =250 "set git update time to 250 ms, instead of default 4 sec

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
nnoremap <Leader>on :on<CR>

" autocmd
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
autocmd BufWritePre *.pl %s/\s\+$//e

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR><CR>
let g:NERDTreeWinSize=45

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

" Fugitive
nnoremap <Leader>ga	:Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gdi :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gv	:Gvsplit<CR>
nnoremap <Leader>gp	:Gpush<CR>
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" YCM
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>g :YcmCompleter GoTo<CR>

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_extensions = ['buffertag','tag','line','dir']
let g:ctrlp_custom_ignore = {
			\ 'dir': 'v[\/]\.(git)$',
			\'file': '\v\.(exe|dll|swp|zip|tmp)$'
			\}

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers=['tslint']

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

" Tagbar
let g:tagbar_type_typescript = {
			\ 'ctagstype': 'typescript',
			\ 'kinds': [
			\ 'c:classes',
			\ 'n:modules',
			\ 'f:functions',
			\ 'v:variables',
			\ 'v:varlambdas',
			\ 'm:members',
			\ 'i:interfaces',
			\ 'e:enums',
			\ ]
			\ }

nmap <F8> :TagbarToggle<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0		" Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1 		" Turn on case insensitive feature
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Vim signify
let g:signify_vcs_list = ['git']
