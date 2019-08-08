"基础配置
set nocompatible        "设置不与vi兼容
set number              "显示行号
syntax on               "设置语法高亮
set showmode            "在底部显示模式
set showcmd             "显示当前已经键入的命令
set mouse=a             "支持使用鼠标
set encoding=utf-8      "使用utf-8编码
filetype indent on      "启用文件类型检查
set autoindent          "启用自动缩进
set tabstop=4           "Tab键显示的空格数
set shiftwidth=4        "使用>>,<<,==时的缩进空格数
set expandtab           "自动将Tab转换为空格
set softtabstop=4       "Tab转换为多少个空格
set wrap                "自动换行
set linebreak           "不会在单词内部折行
set scrolloff=5         "垂直滚动时光标距离上下两端的距离
set laststatus=2        "是否显示状态栏
set ruler               "状态栏中显示当前光标的位置
set showmatch           "自动高亮对应的括号等
set hlsearch            "高亮显示搜索结果
set incsearch           "自动跳转到第一个搜索结果
set ignorecase          "搜索时忽略大小写
set undofile            "保留撤销历史
set tags=./.tags;,.tags "设置tags
"设置删除键的模式
set backspace=indent,eol,start
"设置备份文件、交换文件、操作文件的保存位置
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set autochdir           "自动切换工作目录
set noerrorbells        "不要发出响声
set history=1000        "记住的操作历史数量
set autoread            "打开文件监视
set t_Co=256
"命令模式补全设置
set wildmenu
set wildmode=longest:list,full

filetype off

"vim-plug设置
call plug#begin('~/.vim/plugged')
"autoformat
Plug 'Chiel92/vim-autoformat'
"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
"bufexplorer
Plug 'vim-scripts/bufexplorer.zip'
"gutentags
Plug 'ludovicchabant/vim-gutentags'
"coc.nvim
Plug 'neoclide/coc.nvim', {'tag': '*','branch': 'release','for': ['cpp','c','python','go','html','js','css','json']}
"suda
Plug 'lambdalisue/suda.vim'
"polyglot
Plug 'sheerun/vim-polyglot'
"markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
"vimcdoc
Plug 'yianwillis/vimcdoc'
call plug#end()

"airline配置
let g:airline#extensions#tabline#enabled=1 "air-line显示tab和buffer
let g:airline#extensions#tabline#buffer_nr_show=1 "一个tab中多个buffer
"let g:airline_theme='luna'                   "选择air-line的主题
let g:airline_powerline_fonts=1             "开启powerline字体的支持
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"快捷键设置
let mapleader=','
"bufexplorer
map <leader>o :BufExplorer<cr>
"nerdtree
map <leader>nn :NERDTreeToggle<cr>
"suda
command W w suda://%
"其他
nmap <leader>w :w!<cr>
"快速切换窗口
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"快速调整窗口大小
nnoremap <C-up> <C-W>-
nnoremap <C-down> <C-W>+
nnoremap <C-left> <C-W><
nnoremap <C-right> <C-W>>
"取消搜索高亮
nnoremap <leader>/ :nohl<cr>


"插件配置
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" 自动补全配置
set completeopt=noinsert,menuone,noselect
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
noremap <c-z> <NOP>

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
set tags=./.tags;,.tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

"F3自动格式化代码
nnoremap <silent> <leader>f :Autoformat<CR><CR>
let g:autoformat_verbosemode=1
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"markdown
filetype plugin indent on
let g:instant_markdown_browser = "google-chrome-stable --new-window"
let g:instant_markdown_open_to_the_world = 1
" Use this option to define the table corner character
let g:table_mode_corner = '|'
" Use this option to define the delimiter which used by
let g:table_mode_delimiter = ' '

"polyglot
let g:polyglot_disabled = ['markdown']
