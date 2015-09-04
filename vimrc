if has("syntax")
   syntax on
endif

" jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and plugins according to the detected filetype.
if has("autocmd")
filetype plugin indent on
endif
augroup filetypedetect
 au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END


set showcmd       " Show (partial) command in status line.
set autowrite     " Automatically save before commands like :next and :make
set hidden        " Hide buffers when they are abandoned
"set mouse=a      " Enable mouse usage (all modes)


set nocompatible " breaks compatibility with original vi
set backspace=indent,eol,start " allow backspace in insert mode
set is
set ai
set nobackup
set history=50      " keep 50 lines of command line history


" editor settings
set expandtab     " turn tab into space
set softtabstop=4
set tabstop=4     " number of spaces a tab counts for
set shiftwidth=4  " space for autoindents
set hls
set ignorecase    " case insensitive search
set aw
set smartindent
set showmatch     " Show matching brackets.


" display settings
set number        "show line number
set laststatus=2
set statusline=%f " tail of the filename
set ruler         " show the cursor position all the time
set showmode      " show mode in status bar(insert/replace)
set showcmd       " show typed cmd in status bar
set smartcase     " Do smart case matching
set title         " show title in title bar
set ruler         " show the cursor position all the time
set incsearch     " incremental search
colors desert
syntax on
highlight LineNr ctermfg=grey


" system settings
set confirm       " get a diag when q w x failed
"set foldmethod=indent

set fencs=utf-8,chinese,ucs-bom,gb18030,gbk,gb2312,cp936


" plugins and key maps
execute pathogen#infect()
"autocmd vimenter * NERDTree
" map key settings
map <C-n> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" paste mode toggle (needed when using autoindent/smartindent)
"map <F10> :set paste<CR>
"map <F11> :set nopaste<CR>
"imap <F10> <C-O>:set paste<CR>
"imap <F11> <nop>
"set pastetoggle=<F11>


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
" let g:pydiction_location='~/.vim/complete-dict'
