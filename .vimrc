set nocompatible
filetype off

" Pathogen
" call pathogen#infect()
" call pathogen#runtime_append_all_bundles() 
" call pathogen#helptags()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate'

" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'vim-addon-mw-utils'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype plugin indent on
syntax enable

set history=1000
set undolevels=1000
syn on
"set ts=4
"set backspace=2
"set smarttab
set textwidth=100
"set softtabstop=4
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set copyindent
" Automatically indent when adding a curly bracket, etc. 
set smartindent
" Minimal number of screen lines to keep above and below the cursor. 
set scrolloff=999 
" Use UTF-8. 
set encoding=utf-8

" Set color scheme that I like. 
set t_Co=256
if has("gui_running") 
    set transparency=10
	"set background=light
    colorscheme desert 
else 
	"set background=dark
    "colorscheme devbox-dark-256
endif

"""" Movement
" work more logically with wrapped lines
noremap j gj
noremap k gk
set ignorecase
set smartcase
set incsearch

" hide buffers instead of closing them
set hidden

set pastetoggle=<F2>

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

" Clears search highlight
nnoremap <CR> :noh<CR><CR>

set scrolloff=3

" Status line 
set laststatus=2 
set statusline= 
set statusline+=%-3.3n\                      " buffer number 
set statusline+=%f\                          " filename 
set statusline+=%h%m%r%w                     " status flags 
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type 
set statusline+=%{fugitive#statusline()}	 " vim-fugitive info

set statusline+=%#warningmsg#				 " syntastic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
"
" Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
" let g:neocomplcache_enable_smart_case = 1

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


let Tlist_Ctags_Cmd='$HOME/dev/bin/ctags'
map T :TaskList<CR>
map P :TlistToggle<CR>

"autocmd FileType python set omnifunc=pythoncomplete#Complete
au FileType cheetah set ft=html " For SnipMate
au FileType js set ft=javascript 

"-fuzzyFinder-
"nmap ;b :FufBuffer<CR>
"nmap ;d :FufFile<CR>
"nmap ;f :FufMruFile<CR>
"nmap ;t :FufTag<CR>
"nmap ;j :FufJumpList<CR>

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

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"autocmd BufEnter * silent! lcd %:p:h

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
" let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

" searching
map gr :grep <cword> *<CR>
map gR :grep \b<cword>\b *<CR>

" ie js trailing comma check
nmap ,ie /,\n*\s*}<CR>

" jslint
set makeprg=cat\ %\ \\\|\ /my/path/to/js\ /my/path/to/mylintrun.js\ %
set errorformat=%f:%l:%c:%m

"syntastic

let g:syntastic_mode_map = { 'mode': 'passive',
						   \ 'active_filetypes': ['ruby'],
						   \ 'passive_filetypes': ['python'] }
nmap <Leader>S :SyntasticCheck<CR>
let g:syntastic_python_checker='pylint'
let g:syntastic_javascript_checker='jshint'

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn|*/m/*$',
  \ 'file': '\.pyc$\|\.so$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

nmap ;z :CtrlPMixed<CR>
