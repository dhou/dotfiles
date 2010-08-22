set nocompatible

set history=1000
syn on
set ts=4
set backspace=2
"set smarttab
"set textwidth=79
"set softtabstop=4
set shiftwidth=4
"set expandtab
set autoindent
" Automatically indent when adding a curly bracket, etc. 
set smartindent
" Minimal number of screen lines to keep above and below the cursor. 
set scrolloff=999 
" Use UTF-8. 
set encoding=utf-8

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

" Set color scheme that I like. 
if has("gui_running") 
    set transparency=10
    colorscheme desert 
else 
    colorscheme darkblue 
endif

"""" Movement
" work more logically with wrapped lines
noremap j gj
noremap k gk
set ignorecase
set smartcase
set incsearch
set hidden

" we don't want to edit these type of files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp

" Ctrl + Arrows - Move around quickly
nnoremap <c-k> {
nnoremap <c-j> }
nnoremap <c-l> El
nnoremap <c-h> Bh
 
" Shift + Arrows - Visually Select text
nnoremap <s-k> Vk
nnoremap <s-j> Vj
nnoremap <s-l> vl
nnoremap <s-h> vh
 
if &diff
" easily handle diffing
	vnoremap < :diffget<CR>
	vnoremap > :diffput<CR>
else
" visual shifting (builtin-repeat)
	vnoremap < <gv
	vnoremap > >gv
endif

vnoremap <M-s> <Esc>/\%V

" Q formats paragraphs, instead of entering ex mode
noremap Q gq

"extended % matching
runtime macros/matchit.vim
set scrolloff=3

" Status line 
set laststatus=2 
set statusline= 
set statusline+=%-3.3n\                      " buffer number 
set statusline+=%f\                          " filename 
set statusline+=%h%m%r%w                     " status flags 
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type 
set statusline+=%{fugitive#statusline()}	 " vim-fugitive info
set statusline+=%=                           " right align remainder 
set statusline+=0x%-8B                       " character value 
set statusline+=%-14(%l,%c%V%)               " line, character 
set statusline+=%<%P                         " file position 
" Show line number, cursor position. 
set number
set ruler 
" Display incomplete commands. 
set showcmd 
" Show editing mode 
set showmode 
" Error bells are displayed visually. 
set visualbell
set hlsearch
set showmatch
"highlight current line
highlight CursorLine guibg=lightblue ctermbg=lightgray

set wildmenu
set wildmode=list:longest

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
let Tlist_Ctags_Cmd='/nail/home/dhou/dev/bin/ctags'
map T :TaskList<CR>
map P :TlistToggle<CR>

"autocmd FileType python set omnifunc=pythoncomplete#Complete

"-fuzzyFinder-
nmap ;b :FuzzyFinderBuffer<CR>
nmap ;d :FuzzyFinderFile<CR>
nmap ;f :FuzzyFinderMruFile<CR>
nmap ;g :FuzzyFinderBookmark<CR>
nmap ;t :FuzzyFinderTag<CR>
nmap ;m :FuzzyFinderAddBookmark<CR><CR>
"nmap ;c :FuzzyFinderWithCurrentDirWithCurrentBufferDir<CR>
"nmap ;j :FufJumpList<CR>
nmap <leader>d :FuzzyFinderFileWithCurrentBufferDir<CR>

"-nerdtree-
nmap ,n :NERDTree<CR>

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

set guioptions-=T

map <space> <c-f>
map <backspace> <c-b>

"moving between splits
map ;h <c-w>h
map ;l <c-w>l
map ;j <c-w>j
map ;k <c-w>k
map ;[ <c-w>-
map ;] <c-w>+
map ;r <c-w>r
map ;K <c-w>K
map ;J <c-w>J
map ;H <c-w>H
map ;L <c-w>L
map ;{ <c-w>_
map ;} <c-w>|
map ;= <c-w>=

"splits
map ,t :vert split<CR>
map ,s :split<CR>

"quickfix list
nmap <leader>f :cw<CR>
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

"git commands
nmap <leader>gd :Gdiff<CR>
nmap <leader>b :Gblame<CR>
nmap <leader>s :Gstatus<CR>
nmap <leader>a :Gadd<CR>
nmap <leader>ci :Gcommit<CR>
nmap <leader>p :Gpull<CR>
nmap <leader>ps :Gpush<CR>
nmap <leader>l :Glog<CR>

"compile ranch
nmap <leader>c :make -C /nail/pg/dhou/main/flashAS3/ranch/<CR>
"make templates
nmap <leader>t :make -C /nail/pg/dhou/bt/templates/<CR>
"config
nmap <leader>g :sh /nail/pg/dhou/bt/configure config<CR>

if &t_Co == 256
	colorscheme xoria256
endif

"save and load session
autocmd VimEnter * call LoadSession() 
autocmd VimLeave * call SaveSession() 
function! SaveSession() 
	execute 'mksession! $HOME/.vim/sessions/session.vim' 
endfunction 
function! LoadSession() 
	if argc() == 0 
   		execute 'source $HOME/.vim/sessions/session.vim' 
   	endif 
endfunction

" actionscript for taglist
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

" searching
map gr :grep <cword> *<CR>
map gR :grep \b<cword>\b *<CR>
