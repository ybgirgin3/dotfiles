call plug#begin('~/.config/nvim/autoload')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'         " icons for vim
Plug 'ellisonleao/gruvbox.nvim'
Plug 'ap/vim-css-color'               " Color previews for CSS
Plug 'junegunn/vim-emoji'             " Vim needs emojis!
Plug 'gruvbox-community/gruvbox'

 " Initialize plugin system
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set guicursor=n-v-c-i:block-Cursor
set termguicolors     " enable true colors support
colorscheme gruvbox

if has('nvim')
  set termguicolors
  set inccommand=nosplit
endif

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set ignorecase
set smarttab
set smartcase
filetype plugin indent on
set shiftwidth=2 tabstop=2
set expandtab
set title
set autoindent
set ai
set si
set number
set hlsearch
set ruler

highlight Comment ctermfg=green

hi Visual term=reverse

let mapleader=" "
" NERDTREE
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>t :RgCWord<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

command! -bang -nargs=0 RgCWord
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 1
