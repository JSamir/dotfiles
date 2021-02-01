" Use floating window for fzf
"llet g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }et $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_COMMAND='fd --type f'
"let $FZF_DEFAULT_OPTS=' --color=dark --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp', 'yoffset': 0.1 } }
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  } }

"function! FloatingFZF()
"  let buf = nvim_create_buf(v:false, v:true)
"  call setbufvar(buf, '&signcolumn', 'no')
"
"  let height = float2nr(30)
"  let width = float2nr(150)
"  let horizontal = float2nr((&columns - width) / 2)
"  let vertical = 1
"
"  let opts = {
"        \ 'relative': 'editor',
"        \ 'row': vertical,
"        \ 'col': horizontal,
"        \ 'width': width,
"        \ 'height': height,
"        \ 'style': 'minimal'
"        \ }
"  let win = nvim_open_win(buf, v:true, opts)
"  call setwinvar(win, '&winhl', 'Normal:Pmenu')
"endfunction
