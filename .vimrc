" refs: https://github.com/methane/dotfiles
" coding: utf-8
set nocompatible
let mapleader = ","

set scrolloff=8
set backspace=indent,eol,start
set smartindent
set cindent
set nobackup
set noswapfile
set tabstop=8
set shiftwidth=0
set softtabstop=0
" no indent for case: , public:
set cino=:0,g0,t0
set nowrap
set showcmd
set cmdheight=1
set ignorecase
set tags=tags;/
set nowrapscan
set lazyredraw
set expandtab
" always show statusline
set laststatus=2
set noerrorbells
" bell->vbell & vbell=none
set visualbell t_vb=
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set whichwrap=b,s,h,l,<,>,[,]
set textwidth=0
set ttyfast

" always show tabline
set showtabline=2
if exists('&background')
    set background=dark " dark or light
endif

set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set formatoptions+=mM
set undodir=~/var/vim'

""" plugins

let g:agprg='ag --column'
let g:khuno_ignore='E123,E126,E127,E302,E501'
let g:khuno_max_line_length=99


"let g:gofmt_command = 'goimports'

let g:markdown_fenced_languages = [
\  'css',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'html',
\  'python',
\]

noremap tt :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:ctrlp_extensions = ['buffer', 'line']
let g:ctrlp_clear_cache_on_exit = 1

set t_Co=256

smap <C-k> <Plug>(neosnippet_expand_or_jump)

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
" NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdtree'
let g:vim_markdown_folding_disabled=1

" Color
NeoBundle 'tomasr/molokai'

call neobundle#end()
endif


au BufNewFile,BufRead *.md  setlocal wrap ft=markdown
au BufNewFile,BufRead *.tsv setlocal noexpandtab ts=16
au BufNewFile,BufRead *.go  setlocal noexpandtab ts=4
au BufNewFile,BufRead *.cs  setlocal noexpandtab ts=4
au FileType gitconfig setlocal ts=8 noexpandtab

set wildignore+=vendor/*

nnoremap <silent><C-e> :NERDTreeToggle<CR>
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <C-a> [unite]

" unite.vim keymap
let g:unite_source_history_yank_enable =1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>


" go highlight
au FileType go :highlight goErr cterm=bold ctermfg=214
au FileType go :match goErr /\<err\>/


" :CdCurrent
"   Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

colorscheme molokai
syntax on
filetype plugin indent on