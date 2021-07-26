" _       _ _         _
"(_)_ __ (_) |___   _(_)_ __ ___
"| | '_ \| | __\ \ / / | '_ ` _ \
"| | | | | | |_ \ V /| | | | | | |
"|_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEFAULTS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number          " show line numbers
let mapleader = " "
set cursorline		" highlight current line
set expandtab		" always use spaces over tabs
set softtabstop=4   " use soft tabs with 2 spaces
set tabstop=4       " view tabs as 2 space
set shiftwidth=4    " let indent be 2 spaces
set ignorecase      " make search ignore case

set undofile
set autochdir       " set workingdir wherever open file lives
" manually toggle with `:set autochdir!`
set nofoldenable    " disable folds when opening file

filetype plugin on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER KEYMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uppercase word in normal mode
nnoremap <leader>u <esc>viwUea

" Edit Vim or switch to tab if already open
" see :help myvimrc for environment variables
" :drop edits or jumps to file if open
" inoremap <leader>ev <esc>:tab drop $MYVIMRC<cr>
nnoremap <leader>ev :tab drop $MYVIMRC<cr>

" Source Vim
nnoremap <leader>so :source $MYVIMRC<cr>

" Equalize windows
nnoremap <leader>= <c-w>=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePre * %s/\s\+$//e

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim). (thoughtbot)
autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'AndrewRadev/splitjoin.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'

" Plug 'dense-analysis/ale'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"
" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-eslint', 'coc-rust-analyzer', 'coc-toml', 'coc-vimlsp', 'coc-yank', 'coc-java', 'coc-go']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256   " This is may or may not needed.

syntax enable
colorscheme PaperColor

" set dark background if it's after 20 hours or 8PM
if strftime('%H') >= '20' || strftime('%H') <= '05'
    set background=dark
else
    set background=light
endif

set laststatus=2

if exists("*ToggleBackground") == 0
	function ToggleBackground()
		if &background == "dark"
			set background=light
		else
			set background=dark
		endif
	endfunction

    " call with `:BG`
	command BG call ToggleBackground()
endif
