" Startify
" https://github.com/mhinz/vim-startify
" ---------------------------------------

" Config
let g:startify_disable_at_vimenter = 1 " Don't run Startify at Vim startup. You can still call it anytime via :Startify.
let g:startify_padding_left = 4
let g:startify_change_to_vcs_root = 1 " When opening a file or bookmark, seek and change to the root directory of the VCS (if there is one).

" Remove startheader
let g:startify_custom_header = []

" Bookmarks
let g:startify_bookmarks = [
    \ {'c': '~/.config/nvim/init.vim'},
    \ {'s': '~/.config/nvim/autoload/task.vim'},
    \ ]

" Load possible cache from disk
call task#loadCache()

" Build startpage
let g:startify_lists = [
    \ { 'header': ['    Sessions'],                                  'type': 'sessions' },
    \ { 'header': ['    Most recent files'],                         'type': 'files'     },
    \ { 'header': ['    Most recent files current dir: '. getcwd()], 'type': 'dir'       },
    \ { 'header': ['    Bookmarks'],                                 'type': 'bookmarks' },
    \ ]

    " \ { 'header': ['    Tasks'],                                     'type': function('task#recentTasks'),    'indices': ['t'] },
    " \ { 'header': ['    Releases'],                                  'type': function('task#recentReleases'), 'indices': ['r'] },

