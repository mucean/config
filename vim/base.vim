autocmd BufWritePost ~/.vimrc so ~/.vimrc

syntax on
"syntax enable
set nu
inoremap jk <Esc>
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set backspace=indent,eol,start
set encoding=utf-8                                    "设置gvim内部编码
set fileencoding=utf-8                                "设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文
"set termguicolors

inoremap <C-H> <LEFT>
inoremap <C-J> <DOWN>
inoremap <C-K> <UP>
inoremap <C-L> <RIGHT>

"let mapleader = ","
