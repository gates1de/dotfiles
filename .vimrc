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
set expandtab

filetype plugin indent on

:let g:closetag_html_style=1
:source ~/.vim/scripts/closetag.vim

let s:vim_home=expand('~/.vim')

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/gates1de/.vim/dein/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/gates1de/.vim/dein/.')
  call dein#begin('/Users/gates1de/.vim/dein/.')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/gates1de/.vim/dein/./repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplcache')
  call dein#add('Shougo/vimfiler')
  call dein#add('Shougo/unite-outline')
  call dein#add('majutsushi/tagbar')
  call dein#add('scrooloose/syntastic')
  call dein#add('mattn/emmet-vim')
  call dein#add('fatih/vim-go')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " emmet-vim ---------------------------
  let g:user_emmet_leader_key='<c-e>'
  let g:user_emmet_settings = {
  	\		'variables': {
  	\      'lang': "ja"
  	\    },
  	\   'indentation': '  '
  	\ }
  " -------------------------------------
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" for golang {{{
set path+=$GOPATH/src/**
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

function! s:my_vimfiler_settings()
	nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
	nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
	nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
endfunction

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
	wincmd p
	exec 'split '. a:candidates[0].action__path
endfunction

" call unite#custom_action('file', 'my_split', my_action)

let my_action = {'is_selectable' : 1}

function! my_action.func(candidates)
	wincmd p
	exec 'vsplit '. a:candidates[0].action__path
endfunction
" call unite#custom_action('file', 'my_vsplit', my_action)

if has("mouse")
	set mouse=a
endif
