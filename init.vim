" 如果没安装过vim-plug，则下载安装
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
     \https://raw.GitHub.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set syntax=on
set number
set relativenumber
colorscheme murphy

" 使用vim-plug管理插件
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

let mapleader = "\<space>"
