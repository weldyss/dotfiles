set nocompatible

" Plugins
call plug#begin()
Plug 'shaunsingh/solarized.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'windwp/nvim-autopairs'
call plug#end()

require("nvim-autopairs").setup {}

" Theming
colorscheme solarized
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set t_Co=256

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
                                  " off and the line continues beyond the right of the screen
                                  "
" Files
filetype plugin indent on
syntax on


" Leading
let mapleader=","

map <leader>vs :vsplit<cr>
map <leader>sp :split<cr>
nnoremap <leader><leader> <c-^>

" ncm2 configurations
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" moving lines up and down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-J> :m '>+1<CR>gv=gv
vnoremap <c-K> :m '<-2<CR>gv=gv

" fzf configs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/vendor/*

" fzf shortcuts
map <leader>p :Files<cr>
map <leader>f :Ag<space>

" disable cursor keys in normal mode
map <Left>  :echo "Solta essa porra!"<cr>
map <Right> :echo "Solta essa porra!"<cr>
map <Up>    :echo "Solta essa porra!"<cr>
map <Down>  :echo "Solta essa porra!"<cr>
map <M> :echo "fu"<cr>

" tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-D> :tabclose<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" no more backup or swap file
set nobackup
set noswapfile
