if &shell =~# 'fish$'
    set shell=/bin/bash
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" after install need run command: call mkdp#util#install()
Plugin 'iamcco/markdown-preview.nvim'

Plugin 'cespare/vim-toml'
Plugin 'stephpy/vim-yaml'
Plugin 'elzr/vim-json'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dag/vim-fish'

Plugin 'vim-syntastic/syntastic'

Plugin 'jiangmiao/auto-pairs'

Plugin 'morhetz/gruvbox'

Plugin 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" if len(filter(split(&rtp, ','), 'v:val =~? "vim-markdown"')) > 0 | echo 'yes' | endif

let g:rtp_list = split(&rtp, ',')
function! PluginLoaded(plu)
    "return len(filter(g:rtp_list, 'v:val =~? a:plu')) > 0
    return len(filter(split(&rtp, ','), 'v:val =~? a:plu')) > 0
endfunction

if PluginLoaded("vim-markdown")
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_follow_anchor = 1
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_json_frontmatter = 1
    let g:vim_markdown_strikethrough = 1
    let g:vim_markdown_autowrite = 1
    set conceallevel=2
endif

if PluginLoaded("vim-airline")
    "let g:airline_theme = "papercolor"
    "let g:airline_theme = "base16_spacemacs"
    let g:airline_theme = "base16_gruvbox_dark_hard"
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
endif

if PluginLoaded("vim-fish")
    autocmd FileType fish compiler fish
endif

if PluginLoaded("syntastic")
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0


    let g:syntastic_sh_shellcheck_args = "-P /Users/liuhf/.common-shell"
endif

if PluginLoaded("auto-pairs")
    let g:AutoPairsFlyMode = 1
    let g:AutoPairsMapCh = 0
    au FileType php let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
    au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{''}'])
    au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
    if has("osx")
        let g:AutoPairsShortcutToggle = 'π' " <m-p>
        let g:AutoPairsShortcutFastWrap = '∑' " <m-w>
        let g:AutoPairsShortcutJump = '∆' " <m-j>
        let g:AutoPairsShortcutBackInsert = '∫' " <m-b>
    else
        let g:AutoPairsShortcutFastWrap = <m-w>
        let g:AutoPairsShortcutJump = <m-j>
    endif
endif

if PluginLoaded("gruvbox")
    colorscheme gruvbox
    set background=dark
endif
