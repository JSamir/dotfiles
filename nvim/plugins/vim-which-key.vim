let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
" need the echo so no previous cmd is seen under the popup
autocmd  FileType which_key echo '' | set cmdheight=1 laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> echo '' | set cmdheight=2 laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" f is for file stuff
let g:which_key_map.f = {
      \ 'name' : '+file' ,
      \ 'f' : [':Files'        , 'files'],
      \ 'd' : [':CHADopen'     , 'file explorer'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ }

" b is for buffer stuff
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : [':Buffers'  , 'buffers'],
      \ 'l' : [':CocFzfList location'  , 'locations'],
      \ }
" g is for git stuff
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'j' : ['<plug>(signify-next-hunk)'       , 'next hunk'],
      \ 'k' : ['<plug>(signify-prev-hunk)'       , 'prev hunk'],
      \ 'b' : [':G blame'                        , 'blame'],
      \ }

" l is for LSP stuff
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'd' : ['<Plug>(coc-definition)'          , 'class definition'],
      \ 't' : ['<Plug>(coc-type-definition)'     , 'type definition'],
      \ 'i' : ['<Plug>(coc-implementation)'      , 'implementation'],
      \ 'r' : ['<Plug>(coc-references)'          , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'              , 'rename'],
      \ 'f' : ['<Plug>(coc-format-selected)'     , 'format'],
      \ 'a' : ['<Plug>(coc-codeaction-selected)' , 'code action'],
      \ 'A' : ['<Plug>(coc-fix-current)'         , 'autofix'],
      \ 'o' : [':CocFzfList outline'        , 'outline'],
      \ 'D' : [':CocFzfList diagnostics --current-buf'        , 'diagnostics'],
      \ 's' : [':CocFzfList symbols'    , 'symbols'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
