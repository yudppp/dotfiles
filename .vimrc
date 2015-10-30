"                       _                                       _             
"   _   _   _   _    __| |  _ __    _ __    _ __       __   __ (_)  _ __ ___  
"  | | | | | | | |  / _` | | '_ \  | '_ \  | '_ \      \ \ / / | | | '_ ` _ \ 
"  | |_| | | |_| | | (_| | | |_) | | |_) | | |_) |  _   \ V /  | | | | | | | |
"   \__, |  \__,_|  \__,_| | .__/  | .__/  | .__/  (_)   \_/   |_| |_| |_| |_|
"   |___/                  |_|     |_|     |_|                                
" 

" coding: utf-8
let mapleader = ","

"-------Basic--------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,ucs-2le,ucs-2
set showcmd
set number
set cursorline
set ruler
set wildmenu
set noshowmode
set tabstop=4
set shiftwidth=4
set laststatus=2
set noexpandtab
set vb t_vb=
set whichwrap=b,s,h,l,<,>,[,]

"-------Format--------
set autoindent
set smartindent
set cindent

"-------Search--------
set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch


imap <C-f> <C-x><C-o>

" disable arrow keys
nmap   <Up>     <NOP>
nmap   <Down>   <NOP>
nmap   <Left>   <NOP>
nmap   <Right>  <NOP>

" always show tabline
if exists('&background')
    set background=dark " dark or light
endif

set formatoptions+=mM
set undodir=~/var/vim'

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

""" plugins
let g:gofmt_command = 'goimports'

if isdirectory(expand('~/.vim/bundle/neobundle.vim/')) &&  has('vim_starting')
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neosnippet'
NeoBundle "Shougo/neosnippet-snippets"
if has('lua')
    NeoBundle 'Shougo/neocomplete'
endif

" basic
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'editorconfig/editorconfig-vim'

" for unite
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/unite.vim', {'rev' : '75b43c4779cb21531ab79db8bd8615583eefd2bb'}
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'rking/ag.vim'

" for golang
NeoBundle 'fatih/vim-go'

" Color
NeoBundle 'tomasr/molokai'

call neobundle#end()
endif

set wildignore+=vendor/*
set wildignore+=_vendor/*

" nerdtree
nmap <silent><C-e> :NERDTreeToggle<CR>

" unite.vim
nmap    [unite]   <Nop>
nmap    <C-u> [unite]

let g:unite_source_history_yank_enable =1
let g:unite_split_rule = 'botright'
nmap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nmap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nmap <silent> [unite]g :<C-u>Unite<Space>grep:.<Space>-buffer-name=search-buffer<CR>
nmap <silent> [unite]cg :<C-u>Unite<Space>grep:.<Space>-buffer-name=search-buffer<CR><C-R><C-W><CR>
nmap <silent> [unite]r :<C-u>UniteResume<Space>search-buffer<CR>
nmap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nmap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>

nmap <silent> ,vb :Unite build<CR>
nmap <silent> ,vcb :Unite build:!<CR>
nmap <silent> ,vch :UniteBuildClearHighlight<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" ctrlp.vim
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

let g:indent_guides_enable_on_vim_startup = 1

" vinarise
let g:vinarise_enable_auto_detect = 1 

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_color_change_percent = 10

" go setting
au FileType go imap {<ENTER> {}<LEFT><CR><ESC><S-o>
au FileType go nmap <C-k> <Plug>(go-def-vertical)
au FileType go :highlight goErr ctermfg=208
au FileType go :match goErr /\<err\>/
au BufRead,BufNewFile *.go setlocal ft=go ts=4 sw=4 expandtab
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go']
" let g:syntastic_go_checkers = ['go', 'golint']

" fugitive
au QuickFixCmdPost *grep* cwindow

" vim-gitgutter
let g:gitgutter_diff_args = '-w'

" lightline
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ }

" neosnippet
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)

if has("autocmd")
    au BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" :CdCurrent
"   Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

NeoBundleCheck

colorscheme molokai
syntax on
filetype plugin indent on
