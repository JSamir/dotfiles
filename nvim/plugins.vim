" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'liuchengxu/vim-which-key'

Plug 'junegunn/fzf', { 'dir': '~/tools/system/fzf', 'do': './install --all --xdg --no-bash --no-zsh --64' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'uiiaoo/java-syntax.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
" Plug 'joshdick/onedark.vim'
" Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'romainl/apprentice'
Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'janko/vim-test'
Plug 'ryanoasis/vim-devicons'
Plug 'wellle/targets.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'kevinhwang91/nvim-bqf'
Plug 'jiangmiao/auto-pairs'
call plug#end() 

