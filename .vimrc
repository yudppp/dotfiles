" refs: https://github.com/methane/dotfiles
" coding: utf-8
let mapleader = ","

set number
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" always show tabline
if exists('&background')
    set background=dark " dark or light
endif

set formatoptions+=mM
set undodir=~/var/vim'

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

""" plugins


"let g:gofmt_command = 'goimports'

if isdirectory(expand('~/.vim/bundle/neobundle.vim/')) &&  has('vim_starting')
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neosnippet'
if has('lua')
    NeoBundle 'Shougo/neocomplete'
endif

NeoBundle 'rking/ag.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Color
NeoBundle 'tomasr/molokai'

call neobundle#end()
endif

set wildignore+=vendor/*

nnoremap <silent><C-e> :NERDTreeToggle<CR>
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <C-a> [unite]

" unite.vim keymap
let g:unite_source_history_yank_enable =1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>

let g:indent_guides_enable_on_vim_startup = 1

" vinarise
let g:vinarise_enable_auto_detect = 1 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200


" go err highlight
au FileType go :highlight goErr cterm=bold ctermfg=214
au FileType go :match goErr /\<err\>/

" fugitive
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

au BufNewFile,BufRead *.go  setlocal noexpandtab ts=4

if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" :CdCurrent
"   Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

colorscheme molokai
syntax on
filetype plugin indent on