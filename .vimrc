" ===== Basic settings =====
" 在当前目录下以安全模式读入 .vimrc
set secure
" 显示行号
set number
" 显示相对行号
set relativenumber
" 高亮光标所在行
set cursorline
" 当缓冲区被放弃 ( abandon ) 时不卸载之
set hidden
" indent 缩进
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
" 显示 tab 符号
" set list
" mapping 不检查超时
set notimeout
" 长行 wrap
set wrap
" ?得到一行的缩进位置的表达式
set indentexpr=

" 折叠 按照缩进位置
set foldmethod=indent
" 设置为显示所用打开的折叠
set foldenable
" 自动排版完成的方式
set formatoptions-=tc

" 在状态行上显示补全内容
set wildmenu

" 不区分大小写
set ignorecase
set smartcase


" 高亮显示匹配的括号
set showmatch


" ===== Basic mapping =====

" set leader 
let mapleader=" "
nnoremap <SPACE> <Nop>

" save and quit
noremap Q :q<CR>
noremap S :w<CR>

" Copy
nnoremap Y y$
vnoremap Y "+y

" Indentatoin
nnoremap < <<
nnoremap > >>

" Folding
nnoremap <LEADER>t za

" insert line
nnoremap <LEADER>o o<ESC>
nnoremap <LEADER>O O<ESC>

" ====== regex ======
" TODO
"   1. trans 'key': value
"   2. (v2, v1) -> (v1, v2)