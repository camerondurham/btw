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
syntax enable

"   set scroll-up and scroll-down
" to vim window not terminal window
set mouse=nicr          "   enable mouse in normal,

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER KEYMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

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

" NERDTree shortcut
nnoremap <leader>ne :NERDTree<cr>

" FZF shortcut
nnoremap <leader>f :FZF<cr>

nnoremap <leader>t :tabedit<cr>

" fix syntax highlighting - redraw highlighting
nnoremap <leader>r :syntax sync clear<cr>

nnoremap <leader>l :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ab @@ # TODO <CR>- [ ]


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
Plug 'dkarter/bullets.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/vim-easy-align'
Plug 'kaicataldo/material.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
" Plug 'dense-analysis/ale'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'


" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-eslint', 'coc-rust-analyzer', 'coc-toml', 'coc-vimlsp', 'coc-yank', 'coc-java', 'coc-go', 'coc-yaml', 'coc-sh']

" fix syntax highlighting for tsx files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" source: https://github.com/easymotion/vim-easymotion
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

let g:bullets_nested_checkboxes = 1 " default = 1
" Example:
" - [ ] first bullet
"   - [ ] child bullet  [ type <leader>x ]
"     - [ ] sub-child
"   - [ ] child bullet
"
" Result:
" - [o] first bullet   [ <- indicates partial completion of sub-tasks ]
"   - [X] child bullet
"     - [X] sub-child  [ <- children get checked when parents get checked ]
"   - [ ] child bullet


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has('gui_running')
  set t_Co=256
endif

" Gruvbox colorscheme
let g:gruvbox_dark_contrast = 'light'
let g:gruvbox_light_contrast = 'light'

" Material colorscheme
let g:material_terminal_italics = 1
let g:material_theme_style = 'lighter'
colorscheme material

" need to install iterm2-nightly for this on macos
" refer to: https://github.com/morhetz/gruvbox/wiki/Terminal-specific
"   brew tap homebrew/cask-versions
"   brew install --cask iterm2-nightly
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" get rid of --INSERT -- since it's not needed anymore
set noshowmode

" :h g:lightline.colorscheme
" other good colorschemes: gruvbox, icebergDark
let g:lightline = { 'colorscheme' : 'material_vim' }

hi Normal guibg=NONE ctermbg=NONE

" TODO: convert into a function
" set dark background if it's after 20 hours or 8PM
if strftime('%H:%M') >= '19:15' || strftime('%H:%M') <= '05:30'
    set background=dark
    let g:material_theme_style = 'darker'
    colorscheme material
    let g:lightline = { 'colorscheme' : 'material_vim' }
else
    set background=light
    let g:material_theme_style = 'lighter'
    colorscheme material
    " colorscheme PaperColor
    let g:lightline = { 'colorscheme' : 'material_vim' }
endif

set laststatus=2

if exists("*ToggleBackground") == 0
	function ToggleBackground()
		if &background == "dark"
			set background=light
            let g:material_theme_style = 'lighter'
            colorscheme material
            " colorscheme PaperColor
            let g:lightline = { 'colorscheme' : 'material_vim' }
		else
			set background=dark
            let g:material_theme_style = 'darker'
            colorscheme material
            " colorscheme gruvbox
            let g:lightline = { 'colorscheme' : 'material_vim' }

		endif
        call lightline#init()
        call lightline#update()
	endfunction

    " call with `:BG`
	command BG call ToggleBackground()
endif


" debugging healthcheck
" if has('pythonx')
"   echo 'pyx* commands are available. (Python ' . &pyx . ')'
" endif

" to install neovim python provider:
" pip3 install --user neovim
if has('python3')
  set pyx=3
endif
