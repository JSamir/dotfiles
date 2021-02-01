let g:lightline = {
    \ 'colorscheme' : 'gruvbox_material',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'gitbranch': 'FugitiveHead',
    \   'filename' : 'FullFilenameGit'
    \ },
    \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ },
\ }

function! FullFilenameGit()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline.tabline = {
    \ 'left': [ ['buffers'] ],
\ }

let g:lightline.separator = {
    \   'left': '', 'right': ''
  \}

let g:lightline.subseparator = {
    \   'left': '|', 'right': '|'
  \}

let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }

let g:lightline.component_type = { 'buffers': 'tabsel' }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
