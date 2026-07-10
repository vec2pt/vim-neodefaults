" neodefaults.vim - Default settings from Neovim

" TODO:
" - Add the 'set' checker as 'MaySet' in tpope/vim-sensible.
" - Test the XDG directories on Windows
" - Update the C language-related options ('define', 'include', and 'path'). Create a ftplugin or an autocmd.
" - Update the 'spellfile' file. Create a function to handle the 'spellfile' filename.
" - Test the settings for built-in plugins.
" - Check the behavior of nvim-dir - https://neovim.io/doc/user/plugins/#dir
" - Add mappings `v_Q`, `v_@`
" - Check from which version `n_&` became the default

if exists('g:loaded_neodefaults') | finish | endif
let g:loaded_neodefaults = 1

" Let's leave Neovim alone
if has('nvim') | finish | endif

" Who cares about Windows?
" if has('win32') | finish | endif

" Of course, 'nocompatible'. And let's avoid reset.
if &compatible | set nocompatible | endif

" XDG Base Directories
if empty($XDG_CACHE_HOME)  | if has('win32') | let $XDG_CACHE_HOME=$TEMP          | else | let $XDG_CACHE_HOME=$HOME.'/.cache'       | endif | endif
if empty($XDG_CONFIG_HOME) | if has('win32') | let $XDG_CONFIG_HOME=$LOCALAPPDATA | else | let $XDG_CONFIG_HOME=$HOME.'/.config'     | endif | endif
if empty($XDG_DATA_HOME)   | if has('win32') | let $XDG_DATA_HOME=$LOCALAPPDATA   | else | let $XDG_DATA_HOME=$HOME.'/.local/share'  | endif | endif
if empty($XDG_STATE_HOME)  | if has('win32') | let $XDG_STATE_HOME=$LOCALAPPDATA  | else | let $XDG_STATE_HOME=$HOME.'/.local/state' | endif | endif

if !(exists('g:did_load_filetypes') && exists('g:did_load_ftplugin') && exists('g:did_indent_on'))
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Options
set autoindent
set autoread
set background=dark
set backupdir=$XDG_STATE_HOME/vim/backup/ | call mkdir(&backupdir, 'p') | set backupdir^=.
set belloff=all
if v:version >= 900 | set cdhome | endif
set comments+=fb:•
set commentstring=
set complete-=i
set completeopt=menu,popup
"set define=
if v:version >= 920 | set diffopt+=linematch:40 | endif
set directory=$XDG_STATE_HOME/vim/swap/ | call mkdir(&directory, 'p')
set display=lastline
set encoding=utf-8
if v:version >= 900 | set fillchars+=vert:│,fold:·,foldsep:│ | endif
set formatoptions=tcqj
if executable('rg')
  set grepprg=rg\ --vimgrep\ -uu
else
  set grepprg=grep\ -HIn\ $*\ /dev/null
endif
set hidden
set history=10000
set hlsearch
"set include=
set incsearch
if has('win32') | set isfname-=: | endif
set nojoinspaces
if v:version >= 910 | set jumpoptions= | endif
set keywordprg=:Man
set langnoremap
set nolangremap
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set maxcombine=6
if v:version >= 920 | set maxsearchcount=999 | endif
set mouse=nvi
set mousemodel=popup_setpos
set nrformats=bin,hex
"set path=.,,
set sessionoptions+=unix,slash sessionoptions-=options
set noshelltemp
set shortmess+=F shortmess-=S
if v:version >= 910 | set shortmess+=C | endif
set sidescroll=1
set smarttab
" set spellfile' defaults to stdpath("data").."/site/spell/"
set nostartofline
set switchbuf=uselast
set tabpagemax=50
set tags=./tags;,tags
set termguicolors
set notitle
set titleold=
set ttimeout
set ttimeoutlen=50
set ttyfast
set undodir=$XDG_STATE_HOME/vim/undo/ | call mkdir(&undodir, 'p')
set viewdir=$XDG_STATE_HOME/vim/view/ | call mkdir(&viewdir, 'p')
set viewoptions+=unix,slash viewoptions-=options
set viminfo^=! "viminfo=!,'100,<50,s10,h,r/tmp/,r/private/
set viminfofile=$XDG_STATE_HOME/vim/viminfo
set wildoptions=tagfile
if v:version >= 900 | set wildoptions=+pum | endif


" Plugins
" Not sure if this is the best way to load plugins in this case.
" Based mainly on tpope/vim-sensible.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
if exists(':Man') != 2
  runtime ftplugin/man.vim
endif
if !exists('g:loaded_EditorConfig') && findfile('plugin/editorconfig.vim', &rtp) ==# '' && has('patch-9.0.1799')
  packadd editorconfig
endif
if findfile('plugin/comment.vim', &rtp) ==# '' && has('patch-9.1.1229')
  packadd comment
endif


" Mappings
nnoremap Y y$
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>
nnoremap & :&&<CR>
" - dir-mappings
" Q v_Q-default
" @ v_@-default
vnoremap # yq?p<CR>
vnoremap * yq/p<CR>
