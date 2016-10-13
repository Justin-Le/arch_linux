" Inspired by Jake Zimmerman <jake@zimmerman.io> <https://github.com/jez/vim-as-an-ide>
" Run vim +PluginInstall +qall

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

:set number shiftwidth=4 softtabstop=4 expandtab showcmd lazyredraw
:set number shiftwidth=4 softtabstop=4 expandtab showcmd lazyredraw

:let mapleader = "-"

""""""""""""""""""""""""""""""""""""""""
" Files
""""""""""""""""""""""""""""""""""""""""

" Window navigation
:nnoremap <C-j> <C-W>j
:nnoremap <C-k> <C-W>k
:nnoremap <C-h> <C-W>h
:nnoremap <C-l> <C-W>l

" Navigate tabs
:set switchbuf=usetab
:nnoremap <F8> :tabnext<CR>
:nnoremap <leader><F8> :tabprevious<CR>

" Write
:nnoremap <leader>w :w<Enter>

" Write, then quit
:nnoremap <leader>q :w<Enter>:q<Enter>

" Write, then suspend Vim
:nnoremap <leader><C-z> :w<Enter><C-z>

" Activate DOS format for .txt, then write, then quit
:nnoremap <leader>dos :w<Enter>:e<Space>++ff=dos<Enter>:w<Enter>:q<Enter>

" Edit ~/.vimrc
:nnoremap <leader>rc :sp $MYVIMRC<cr>

" Write, then overwrite vimrc.txt, then quit
:nnoremap <leader>trc :w<Enter>:w!<Space>~/vimrc.txt<Enter>:q<Enter>

""""""""""""""""""""""""""""""""""""""""
" Libraries
""""""""""""""""""""""""""""""""""""""""

" Insert numpy, pandas, pyplot
:nnoremap <leader>npp iimport<Space>numpy<Space>as<Space>np<Enter><Esc>
                      iimport<Space>pandas<Space>as<Space>pd<Enter><Esc>
                      iimport<Space>matplotlib.pyplot<Space>as<Space>plt<Enter><Esc>
:nnoremap <leader>np iimport<Space>numpy<Space>as<Space>np<Enter><Esc>
:nnoremap <leader>pd iimport<Space>pandas<Space>as<Space>pd<Enter><Esc>
:nnoremap <leader>plt iimport<Space>matplotlib.pyplot<Space>as<Space>plt<Enter><Esc>

""""""""""""""""""""""""""""""""""""""""
" Text
""""""""""""""""""""""""""""""""""""""""

" Prepare to replace globally
:nnoremap <leader>s :%s/

" Move cursor to the character after the next underscore
:nnoremap <leader>- f_l

" Move cursor to the character after the second next underscore
:nnoremap <leader>= f_f_l

" Highlight all characters before the next underscore
:vnoremap <leader>- f_h

" Highlight all characters before the second next underscore
:vnoremap <leader>= f_f_h

" Insert :nnoremap <leader>
:nnoremap <leader>nl i:nnoremap<Space><leader<Space><Backspace>>

" Delete all characters from current position to end of line
" without moving next line
:nnoremap <leader>4d v$hd

" Cut all characters from current position to end of line
" without moving next line
:nnoremap <leader>4x v$hx

" Insert ) before the next whitespace
:nnoremap <leader>) Ea)<Esc>

" Insert ( after the next whitespace
:nnoremap <leader>( Bi(<Esc>

" Add a space beside comment delimiters in NERDcommenter
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""

:nnoremap <leader>item i\begin{itemize}<Enter>\item<Enter>\item<Space><Esc>kA<Space>

:nnoremap <leader>4 i$<Esc>El
:nnoremap <leader>[ i\[<Esc>E
:nnoremap <leader>] a\]<Esc>E

:nnoremap <leader>it i\textit{<Esc>E

let g:tex_flavor = "tex"
:filetype plugin on
:syntax on
:set number
