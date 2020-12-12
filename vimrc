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
"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"suda
Plug 'lambdalisue/suda.vim'
"coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

"suda
command W w suda://%

" 自动补全配置
set completeopt=noinsert,menuone,noselect
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
noremap <c-z> <NOP>

"设置备份文件、交换文件、操作文件的保存位置

" 检测所需文件夹，不存在就重建
function CreateDirIfNotExist(path)
    if !isdirectory(a:path)
        silent! call mkdir(a:path)
    endif
endfunction

call CreateDirIfNotExist('~/.vim/.backup')
call CreateDirIfNotExist('~/.vim/.swp')
call CreateDirIfNotExist('~/.vim/.undo')

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
