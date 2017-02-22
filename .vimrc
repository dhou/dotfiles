set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'L9'
Plugin 'majutsushi/tagbar'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" At work, or not:
if filereadable(expand('~/.google'))
  " Google-only
  source ~/.vimrc_google
  source /usr/share/vim/google/google.vim
  Glug codefmt-google auto_filetypes+=blazebuild,java
  " Glug piper plugin[mappings]
  Glug relatedfiles plugin[mappings]
  Glug gtimporter
  Glug youcompleteme-google
  Glug corpweb

  source /usr/share/vim/google/gtags.vim

  nnoremap <C-]> :exe 'let searchtag= "' . expand('<cword>') . '"' \| :exe 'let @/= "' . searchtag . '"'<CR> \| :exe 'Gtlist ' . searchtag <CR>

  " command Jade !/google/data/ro/teams/jade/jade %

  " Google mappings
  " noremap <unique> <leader>g :GtImporter<CR>
  " noremap <unique> <leader>cs :CorpWebCs<Space>
  " noremap <unique> <leader>cf :CorpWebCsFile<CR>
else
  " Non-Google only
  Plugin 'Valloric/YouCompleteMe'
endif

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
set shiftwidth=2
" set tabstop=2
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
    set background=light
    colorscheme desert
else
    set background=dark
    colorscheme desert
endif

hi Normal ctermbg=none
" hi NonText ctermbg=none

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
set statusline+=%{fugitive#statusline()}  " vim-fugitive info

set statusline+=%#warningmsg#     " syntastic
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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"autocmd FileType python set omnifunc=pythoncomplete#Complete
au FileType cheetah set ft=html " For SnipMate
au FileType js set ft=javascript

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

" searching
map gr :grep <cword> *<CR>
map gR :grep \b<cword>\b *<CR>

" ie js trailing comma check
nmap ,ie /,\n*\s*}<CR>

" jslint
set makeprg=cat\ %\ \\\|\ /my/path/to/js\ /my/path/to/mylintrun.js\ %
set errorformat=%f:%l:%c:%m

"-nerdtree-
nmap ,n :NERDTree<CR>
nmap ,r :NERDTreeFind<CR>

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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" eclim
nmap <leader>f :JavaSearchContext<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" cd to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

filetype plugin indent on    " required
