set modelines=0 " CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
set nocompatible "Use Vim defaults instead of 100% vi compatibility
" set backspace=2,indent,eol,start " more powerful backspacing
set backspace=2
set encoding=utf8

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

colorscheme molokai
syntax on

set number
set laststatus=2
set showmatch
set noswapfile

set backspace=indent,eol,start

set ignorecase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
filetype plugin indent on

let g:user_emmet_settings = {
			\   'lang' : 'ja'
			\ }

:let g:closetag_html_style=1
:source ~/.vim/scripts/closetag.vim

let s:vim_home=expand('~/.vim')
if has('vim_starting')
  let &runtimepath.=printf(',%s/bundle/neobundle.vim', s:vim_home)
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundleFetch 'Shougo/neobundle.vim'

set rtp^=$GOROOT/misc/vim
set rtp^=$GOPATH/src/github.com/nsf/gocode/vim

set nocompatible               " be iMproved
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	"call neobundle#rc(expand('~/.vim/bundle/'))
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

" emmet-vim ---------------------------
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
	\		'variables': {
	\      'lang': "ja"
	\    },
	\   'indentation': '  '
	\ }
" -------------------------------------
filetype plugin indent on     " required!
filetype indent on
syntax on
NeoBundleCheck
" }}}

" for golang {{{
set path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
au FileType go compiler go
" }}}

" VimFilerTree {{{
command! VimFilerTree call VimFilerTree()
function VimFilerTree()
	exec ':VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit'
	wincmd t
	setl winfixwidth
endfunction

autocmd! FileType vimfiler call g:my_vimfiler_settings()

function! g:my_vimfiler_settings()
	nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
	nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
	nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
endfunction

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
	wincmd p
	exec 'split '. a:candidates[0].action__path
endfunction

call unite#custom_action('file', 'my_split', my_action)

let my_action = {'is_selectable' : 1}

function! my_action.func(candidates)
	wincmd p
	exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

if has("mouse")
	set mouse=a
endif
