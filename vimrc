set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'Lokaltog/vim-easymotion'
call vundle#end()

set rtp+=~/.vim/bundle/ctrlp.vim
set wildignore+=cmake.bld
let g:ctrlp_open_new_file = 't'

filetype plugin indent on

fixdel
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cindent
set colorcolumn=80
set expandtab
set hlsearch
set incsearch
set laststatus=2
set list
set mouse=a
set noerrorbells
set number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set softtabstop=4
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set t_vb=
set tabpagemax=100
set tabstop=4
set virtualedit=block
set visualbell
set wildmode=longest,list
syntax on

if has("multi_byte")
	let g:local_encoding = &encoding
	if &encoding !~? '^u'
		if &termencoding == ""
			let &termencoding = &encoding
		endif
		set encoding=utf-8 fileencodings=ucs-bom,utf-8,latin1
	endif
endif

if &encoding == "utf-8"
	set listchars=tab:▸∙,trail:∙
else
	set listchars=tab:>-,trail:-
endif

map <Leader> <Plug>(easymotion-prefix)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
