"if has("syntax")
"   syntax on
"endif

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"source /etc/vim/vimrc.local
"endif


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
filetype plugin indent on
endif
augroup filetypedetect
 au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END



set number          " show line number
set expandtab       " expand tab
set softtabstop=4   "
set tabstop=4       "
set shiftwidth=4    "
set incsearch       " incremental search
set ignorecase      " Do case insensitive matching
set smartindent
set smartcase       " Do smart case matching
set showmatch       " Show matching brackets.
set showcmd     " Show (partial) command in status line.
set autowrite       " Automatically save before commands like :next and :make
set ruler           " show the cursor position all the time

set nocompatible " breaks compatibility with original vi
set backspace=indent,eol,start " allow backspace in insert mode
set is
set ai
set si
set nobackup
set history=50      " keep 50 lines of command line history
"set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)
"set foldmethod=indent


syntax on
colors desert
"colors molokai
"set background=dark
"set background=light

highlight LineNr ctermfg=grey

set fencs=utf-8,chinese,ucs-bom,gb18030,gbk,gb2312,cp936


"NERDTree setting
"autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map <f12> :!start /min ctags -R .<cr>


" 使用pylint
"autocmd FileType python compiler pylint
" 避免每次保存文件都运行一次
"let g:pylint_onwrite = 0
" F6检查代码
"map <F6> :w<cr>:Pylint<cr>


"pydict

filetype plugin on
"let g:pydiction_location='~/.vim/complete-dict'
