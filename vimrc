set nocompatible

" 界面设置
syntax on
set number
set relativenumber
set incsearch
set ignorecase
set cursorline
set wrap
set showcmd
set wildmenu
set smartcase
set scrolloff=5
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hidden

let mapleader = "\<space>"

"自动编译运行
nnoremap <C-r> :call CompileRunGcc()<CR>

func! CompileRunGcc()
     exec "w"
     if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%'
     elseif &filetype == 'python'
        exec '!time python3 %'
     elseif &filetype == 'go'
        exec '!time go run %'
     endif
endfunc

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
"autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'



" vim-plug
call plug#begin('~/.vim/plugged')

" ******************************外观******************************
"vim-colorschemes
Plug 'flazz/vim-colorschemes'
"change scheme
Plug 'chxuan/change-colorscheme'
"vim start page
Plug 'mhinz/vim-startify'
" Pretty Dress
Plug 'bpietravalle/vim-bolt'
Plug 'theniceboy/nvim-deus'

" ******************************状态栏******************************
"vim-airline
Plug 'vim-airline/vim-airline'
"vim-airline themes
Plug 'vim-airline/vim-airline-themes'

" *****************************侧边栏*******************************
" nerdtree
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
"nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
"tarbar
Plug 'majutsushi/tagbar'


" *****************************GO*******************************
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'dgryski/vim-godef'
"Plug 'Valloric/YouCompleteMe'


" *****************************mark down*******************************
" Plug 'iamcco/markdown-preview.vim'


" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

"******************Editor enhencement ***************************
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`


Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" ******************************END******************************

let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 2

"==============================================================================
" vim-go 插件
"==============================================================================
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2
let g:go_doc_keywordprg_enabled = 0

map <C-s> :w<CR>
map <C-q> :q<CR>
map R :source $MYVIMRC<CR>

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
nnoremap <S-Tab> <C-W>w
nnoremap J 5j
nnoremap K 5k
nnoremap <C-tab> <C-w>w
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap R :GoRun<CR>
"nnoremap <C-j> <C-e>
"nnoremap <C-k> <C-y>
"nnoremap <C-w> dw
nnoremap <silent> bl :ls<CR>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> bd :bdelete<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>

" ===
" === normal mode key map
" ===
nnoremap gu gU
nnoremap gl gu

"
"  insert mode key map
"
inoremap jk <Esc>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-a> <Home>
inoremap <C-e> <End>

"
"  【insert,normal,command】 mode key map
"
"noremap <space> :
noremap H ^
noremap L $



"vim-airline{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='solarized'
"}

"NerdTree{
"autocmd vimenter * NERDTree  "自动开启Nerdtree
"开启/关闭nerdtree快捷键
nnoremap <F4> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeShowHidden=1     "不显示隐藏文件
"目录树宽度
let g:NERDTreeWinSize=35
let g:NERDTreeWinPos="left"
let g:NERDTreeGlyphReadOnly="RO"
"高亮
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1
let g:NERDTreeMatchHighlightFolders=1
let g:NERDTreeMatchHighlightFoldersFullName=1
let g:NERDTreeHighlightCursorline=0
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"自动触发
"augroup nerdtree_
"    autocmd!
"    autocmd StdinReadPre * let s:std_in=1
"    "打开vim时没有指定打开的文件，自动打开目录树
"    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"augroup END
"}

"YcmCompleter{
let g:ycm_global_ycm_extra_conf = '~/.config/ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_sysbol = '>*'
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{1}'],
			\ }
set completeopt=longest,menu
nnoremap jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}

"fzf{
set rtp+=/usr/local/opt/fzf
"nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>ff :Rg<CR>
"}
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

