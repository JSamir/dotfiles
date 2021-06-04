" Set session dir
let g:startify_session_dir = '~/.cache/nvim/sessions/'

let g:startify_lists = [
\ { 'type': 'files',     'header': ['   Files']            },
\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
\ { 'type': 'sessions',  'header': ['   Sessions']       },
\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\ ]

let g:startify_bookmarks = [
\ { 'i': '~/.config/nvim/init.vim' },
\ { 'z': '~/.zshrc' },
\ '~/svn/is',
\ '~/git/cde',
\ '~/svn/testing',
\ ]
