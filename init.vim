set nocompatible 
" filetype indent on
filetype off
syntax on
set encoding=UTF-8
set noswapfile
set scrolloff=7 
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set number
set relativenumber
set mouse=a
set hlsearch
set incsearch
set hidden
set fdm=indent
set foldlevelstart=99
set ignorecase
set smartcase
set cursorline
set dictionary+=/usr/share/dict/words
set colorcolumn=80
set splitbelow splitright " set default position for where a split open
set fileformat=unix

" Keybindings

" leader keys
let mapleader=" "
let maplocalleader=","

set rtp+=~/.config/nvim/Vundle.vim
let vundle_path="$HOME/.local/share/nvim/site/pack/plugins/start"

call vundle#begin(vundle_path)

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/CSApprox'

Plugin 'jiangmiao/auto-pairs'

" python plugin
Plugin 'zchee/deoplete-jedi'

Plugin 'norcalli/nvim-colorizer.lua'


call vundle#end()

filetype plugin indent on

if(has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()


" faster way to ESC from insert mode
imap kj <ESC>

" open config file in a new tab
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" reload config file
nnoremap <leader>sv :source $MYVIMRC<CR>

" clear search highlights
nnoremap <silent> <leader>a :<C-u>nohlsearch<CR><C-1>

" navigate between buffers
nnoremap <leader>l :bprevious<CR>
nnoremap <leader>K :bnext<CR>
nnoremap <leader>h :bfirst<CR>
nnoremap <leader>l :blast<CR>

" show all buffers and let user choose one
nnoremap <leader>i :ls<CR>:b<Space>

" delete current buffer
nnoremap <leader>dd :bd<CR>

" close current window
nnoremap <leader>c :q<CR>

" write current buffer 
nnoremap <leader>w :write<CR>

" navigater between tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" toggle highlight current line
nnoremap <leader>ar :setlocal cursorline!<CR>

" toggle highlight current column
nnoremap <leader>ac :serlocal cursorcolumn!<CR>

" switch between two buffer
nnoremap <leader><tab> <C-^>

" add current line to X Clipboard
nnoremap <leader>yy :normal "+yy<CR>

" add current selected text to X Clipboard
nnoremap <leader>yy :normal gv"+y<CR>

set termguicolors
colorscheme base16-tomorrow-night

" Airline config
set noshowmode " hide --insert status line
let g:airline_theme = 'base16_tomorrow'

" NEARDCommenter
" nnoremap <C-_> <Plug>NERDCommenterToggle
" vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
 

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
" nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-q> :bp<CR>
nmap <C-w> :bn<CR>

" Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

augroup exe_code
    autocmd!

    " execute python code
    autocmd FileType python nnoremap <buffer> <localleader>r
                \ :sp<CR> :term python3 %<CR> :startinsert<CR>

    " execute javascript code
    autocmd FileType javascript nnoremap <buffer> <localleader>r
                \ :sp<CR> :term nodejs %<CR> :startinsert<CR>

    " execute bash code
    autocmd FileType bash, sh nnoremap <buffer> <localleader>r
                \ :sp<CR> :term bash %<CR> :startinsert<CR>
augroup END
