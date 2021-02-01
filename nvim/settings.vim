" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Show numbers
set nu
set tabstop=4
set shiftwidth=4
" Use spaces for tab
set expandtab
set encoding=utf-8
" Whitespaces
set list lcs=tab:»·,trail:·,eol:¶
" Show current (relative) line number
set number
set relativenumber
" Dont need the mode shown under statusline
set noshowmode
" Undo changes even after saving a file
set undofile
set undodir=~/.cache/nvim/undo
" Set session dir
let g:prosession_dir = '~/.cache/nvim/sessions/'
" Open new split panes to right and bottom
set splitbelow
set splitright
" Highlight the line on which the cursor lives.
set nocursorline
" On first <Tab> it will complete to the longest common string and will invoke wildmenu
set wildmenu
set wildmode=longest:full,full
" Always show at least one line above/below the cursor.
set scrolloff=10
" Always show at least one line left/right of the cursor.
set sidescrolloff=5
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Use system clipboard
set clipboard+=unnamedplus
" Remove timeout for partially typed commands
"set notimeout
" Allow switching between buffers without saving
set hidden
" Case insensitive searching
set ignorecase
" Will automatically switch to case sensitive for search if you use any capitals
set smartcase
" show tabline
set showtabline=2
set laststatus=2

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
