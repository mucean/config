if &shell =~# 'fish$'
    set shell=/bin/bash
endif

function! PluginLoaded(plu)
    return len(filter(split(&rtp, ','), 'v:val =~? a:plu')) > 0
endfunction

set nocompatible              " be iMproved, required
filetype on
syntax on
" To ignore plugin indent changes, instead use:
filetype plugin on
filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

"Plug 'junegunn/vim-plug'

" after install need run command: call mkdp#util#install()
Plug 'iamcco/markdown-preview.nvim'

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'dag/vim-fish'

Plug 'vim-syntastic/syntastic'

Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'

"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" spell check
Plug 'reedes/vim-lexical'

Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

"Plug 'govim/govim', { 'for': ['go'] }

Plug 'ctrlpvim/ctrlp.vim'

Plug 'ryanoasis/vim-devicons'

call plug#end()

Plug 'ycm-core/YouCompleteMe', { 'on': [] }

let plugins = ["nerdtree", "ctrlp.vim"]

if exists('$confdir')
    for plu in plugins
        if PluginLoaded(plu)
            let $pluConf = $confdir . "/plugins/" . plu . ".vim"
            source $pluConf
        endif
    endfor

    augroup load_complete
        autocmd!
        "au BufNewFile,BufRead *.go call plug#load('govim') | source $confdir/plugins/govim.vim | autocmd! load_complete
        "au BufNewFile,BufRead *.?,*.g[^o]*,*.go?*,*.[^g]* source $confdir/plugins/youcompleteme.vim | call plug#load('YouCompleteMe') | autocmd! load_complete
        au BufNewFile,BufRead * if !PluginLoaded("govim") | source $confdir/plugins/youcompleteme.vim | call plug#load('YouCompleteMe') | endif | autocmd! load_complete
    augroup end
endif

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


    let g:syntastic_sh_shellcheck_args = "-P $HOME/.common-shell"
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
        let g:AutoPairsShortcutFastWrap = '<m-w>'
        let g:AutoPairsShortcutJump = '<m-j>'
    endif
endif

if PluginLoaded("gruvbox")
    colorscheme gruvbox
    set background=dark
endif

if PluginLoaded("ultisnips")
    "let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsExpandTrigger="<Leader>se"
    let g:UltiSnipsJumpForwardTrigger="<Leader>sn"
    let g:UltiSnipsJumpBackwardTrigger="<Leader>sp"
endif

if PluginLoaded("vim-lexical")
    augroup lexical
        autocmd!
        autocmd FileType markdown,mkd call lexical#init()
        autocmd FileType go,php call lexical#init()
    augroup END
    let g:lexical#spell = 1         " 0=disabled, 1=enabled
endif
