" Vundle Plugin Manager ------------------------------- {{{
if !has('neovim')
    " boilerplate ----------------------------------------- {{{
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    " }}}

    " Navigation
    Plugin 'scrooloose/nerdtree'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'majutsushi/tagbar'
    Plugin 'kien/ctrlp.vim'

    " IDE-like features
    Plugin 'jpalardy/vim-slime'
    Plugin 'tpope/vim-surround'
    Plugin 'tmux-plugins/vim-tmux'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'osyo-manga/vim-brightest'
    "Plugin 'AutoComplPop'

    " Python
    Plugin 'tmhedberg/SimpylFold'
    ""Plugin 'hdima/python-syntax'
    ""Plugin 'https://github.com/vim-scripts/python.vim--Vasiliev'
    ""Plugin 'klen/python-mode'
    ""Plugin 'python-rope/ropevim'

    " Snipmate and snipmate dependencies
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'

    " Haskell
    Plugin 'lukerandall/haskellmode-vim'
    Plugin 'vim-scripts/haskell.vim'

    " Appearance
    Plugin 'slim-template/vim-slim'
    Plugin 'thinca/vim-guicolorscheme'

    " Colorschemes
    Plugin 'tomasr/molokai'
    Plugin 'nanotech/jellybeans.vim'

    " boilerplate ----------------------------------------- {{{
    call vundle#end()
    filetype plugin indent on

    " Required for vim slime to work with ipython
    let g:slime_target = "tmux"
    let g:slime_paste_file = "$HOME/.slime_paste"
    let g:slime_python_ipython = 1
    " }}}
endif
" }}}
if has('nvim')
call plug#begin()

    Plug 'scrooloose/nerdtree'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'jpalardy/vim-slime'
    Plug 'tpope/vim-surround'
    Plug 'tomasr/molokai'
    "Plug 'kein/ctrlp' " fuzzy search for vim tags
    Plug 'majutsushi/tagbar'

    " Autocomplete
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tmsvg/peartree'

    " Haskell
    Plug 'neovimhaskell/haskell-vim'
    Plug 'commercialhaskell/hindent'
    Plug 'jaspervdj/stylish-haskell'
    Plug 'eagletmt/neco-ghc'
    Plug 'calebsmith/vim-lambdify'
    Plug 'glittershark/vim-hare'
    Plug 'vim-scripts/hlint'

    " Other stuff
    Plug 'chrisbra/Colorizer'

    " Rust
    Plug 'rust-lang/rust.vim'

call plug#end()
endif
" Set Default Appearance ------------------------------ {{{

set relativenumber
set number
colorscheme molokai
set colorcolumn=50,65,80
highlight ColorColumn ctermbg=Black
highlight ColorColumn guibg=#222222

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Allow trransparent background.
hi Normal guibg=NONE ctermbg=NONE
" }}}
" Set Default Vim Behavior ---------------------------- {{{
" Hopefully this will stop that infernal beeping.
set vb t_vb=

" More natural split direction.
set splitbelow
set splitright

" Make tabs 4 spaces, but stil behave like tabs.
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" vim rope
let ropevim_vim_completion=1

" set formatting for comments
set formatprg=par\ -w65jf

" }}}
" Language-Specific Behavior -------------------------- {{{
au BufNewFile,BufRead *.py let g:python_highlight_all = 1

au BufRead,BufNewFile *.plx set filetype=plx

au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
:augroup cpp_indent
:   autocmd Filetype cpp set shiftwidth=2
:   autocmd Filetype cpp set softtabstop=4
:   autocmd Filetype cpp set foldmethod=syntax
:augroup END

:augroup cpp11
:   autocmd Filetype cpp let g:syntastic_cpp_compiler = "g++"
:   autocmd Filetype cpp let g:syntastic_cpp_compiler_options = " -std=c++11 -stdlib=libc++ "
:augroup END

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_enable_backpack = 1

" }}}
" Remappings ------------------------------------------ {{{

" These should already be in there by default
nnoremap Y y$
inoremap <S-CR> <esc>j
inoremap <C-Tab> <esc>

" Sometimes I want to use arrows when in insert mode
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
inoremap <C-BS> <Del>

" Just in case I still need those keybindings for whatever reason.
inoremap <Left> <C-H>
inoremap <Down> <C-J>
inoremap <Up> <C-K>
inoremap <Right> <C-L>

" move line down one
nnoremap - ddp
nnoremap _ ddkP

" Quicker switching between splits.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open specific files on the computer.
nnoremap <leader>rc :split  ~/.vimrc<cr>
nnoremap <leader>RC :vsplit ~/.vimrc<cr>
nnoremap <leader>sn :split ~/.vim/bundle/vim-snippets/snippets/<CR>
nnoremap <leader>SN :vsplit ~/.vim/bundle/vim-snippets/snippets/<CR>

" Use the tagbar plugin.
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Use CtrlP
nnoremap <silent> <Leader>B :CtrlP<CR>

" Ctrl+A interferes with tmux.
nnoremap <Leader><C-x> <C-a>
" }}}
" Autocorrect ----------------------------------------- {{{
iab retrun return
iab improt import
iab gloabl global
iab import\ import impot
iab ednl endl
"  }}}
" Allow manual folding in vim files ------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Syntastic Settings ---------------------------------- {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
" Other ----------------------------------------------- {{{
let g:haddock_browser="/usr/bin/firefox"
"}}}
