set number
set ruler
syntax enable           " enable syntax processin
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

au BufEnter * :hi EndOfBuffer guibg=bg guifg=bg
"au BufEnter * :Minimap
au BufEnter * :hi VertSplit guibg=bg guifg=bg

"plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
call plug#end()

"minimap
let g:minimap_highlight='Visual'

"vim tex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"utilsnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"colors
colorscheme wal


