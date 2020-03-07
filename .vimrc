set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" let Vundle manage Vundle, required

Plugin 'Townk/vim-autoclose'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'gavinbeatty/dragvisuals.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=2         " Tabs are 2 spaces
set expandtab         " Always use spaces rather than tabs characters
set shiftwidth=2      " Size of an 'indent'
set number

highlight ColorColumn ctermbg=DarkGray
set colorcolumn=80
set smartcase
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on             " Enable syntax highlighting
colorscheme onedark

let g:ctrlp_max_files=0
set ignorecase

highlight ExtraWhitespace guibg=#87d7ff ctermbg=Blue

:nnoremap <C-g> :NERDTreeToggle<CR>
:noremap <F4> :ColorToggle<CR>
:noremap <F3> :set hlsearch! hlsearch?<CR>
:noremap <F2> :ToggleWhitespace<CR>
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

let mapleader = "\<Space>"
nnoremap <Leader>r gt
nnoremap <Leader>e gT

" Remove any introduced trailing whitespace after moving...  
let g:DVB_TrimWS = 1

nmap <silent> <C-l> <Plug>(jsdoc)
"let g:jsdoc_enable_es6 = 1

let g:jsx_ext_required = 0

"Faster <C-y>
imap <C-b> <Space><BS>
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
imap dsc describe("", () => {<CR>  it("", () => {<CR>  expect();<CR>});<CR>}<Esc>A;<Esc>V4k=f'a
imap iii it("", () => {<CR> expect()<CR>}<Esc>A;<Esc>V2k=f'a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p )
vmap "" c""<Esc>P
vmap (( c()<Esc>P
vmap [[ c[]<Esc>P
vmap {{ c{}<Esc>P

abbr tc :tabclose<CR>
