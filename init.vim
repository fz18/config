" 如果没安装过vim-plug，则下载安装
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
     \https://raw.GitHub.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = "\<space>"
set syntax=on
set number
set relativenumber
set hidden
set splitright
set splitbelow
colorscheme molokai
" 背景透明
hi Normal guibg=NONE ctermbg=NONE 
hi diffAdded ctermfg=188 ctermbg=64 cterm=bold guifg=#50FA7B guibg=NONE gui=bold
hi diffRemoved ctermfg=88 ctermbg=NONE cterm=NONE guifg=#FA5057 guibg=NONE gui=NONE
hi MatchParen cterm=reverse

" 使用vim-plug管理插件
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
" 用于插入代码片段
" ultisnips是snippets的管理器
" Plug 'SirVer/ultisnips'

" vim-snippets是具体snippets的定义，可添加自己定义的代码片段
Plug 'honza/vim-snippets'
call plug#end()

" ==================== coc.nvim ====================
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-p> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <Leader>k :call Show_documentation()<CR>
nnoremap <Leader>rn <Plug>(coc-rename)
nmap <silent> gD :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap ts <Plug>(coc-translator-p)

" =================vim-go ===============

let g:go_highlight_functions=1
let g:go_highlight_types=1
let g:go_highlight_function_calls=1
let g:go_highlight_extra_types=1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_doc_popup_window=1
let g:go_def_mapping_enabled=0
let g:go_term_enabled=1
let g:go_term_mode=":split"



nnoremap <esc><esc> :noh<return><esc>

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>r :GoRun<CR>
nnoremap <silent> <Leader>e <Cmd>CocCommand explorer<CR>
nnoremap <silent> <Leader>q :q<CR>
map    	 <silent> <Leader>t :term<CR>


