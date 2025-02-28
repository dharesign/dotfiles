set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'easymotion/vim-easymotion'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'jacoborus/tender.vim'
    Plugin 'luochen1990/rainbow'
    Plugin 'itchyny/lightline.vim'
    Plugin 'rust-lang/rust.vim'
    Plugin 'leafgarland/typescript-vim'
call vundle#end()

set rtp+=~/.vim/bundle/ctrlp.vim
set wildignore+=cmake.bld
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
  \ 'AcceptSelection("t")': ['<cr>']
  \ }
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files']
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

filetype plugin indent on

fixdel
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cindent
set colorcolumn=80
set expandtab
set foldlevelstart=99
set foldmethod=syntax
set hlsearch
set incsearch
set laststatus=2
set list
set mouse=a
set noerrorbells
set noshowmode
set nowrap
set number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set softtabstop=4
set t_vb=
set tabpagemax=100
set tabstop=4
set textwidth=79
set virtualedit=block
set visualbell
set wildmode=longest,list
syntax on

if (has("termguicolors"))
    set termguicolors
endif
colorscheme tender

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

let g:rainbow_active=1
let g:rainbow_conf={
\ 'guifgs': ['#a8e6cf','#dcedc1','#ffd3b6','#ffaaa5','#ff8b94']
\ }

let g:lightline = { 'colorscheme': 'tender' }

let g:rustfmt_autosave = 1
let g:rust_recommended_style = 0
let g:netrw_banner = 0

"function FormatBufferCpp()
"    if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
"        let cursor = getpos('.')
"        :%!bde-format
"        call setpos('.', cursor)
"    endif
"endfunction
"
"autocmd BufWritePre *.h,*.cpp :call FormatBufferCpp()
