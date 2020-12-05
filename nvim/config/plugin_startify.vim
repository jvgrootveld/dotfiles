" Startify
" https://github.com/mhinz/vim-startify
" ---------------------------------------

"" TODO
"" Rename functions to localscope (Some global for FZF use)

" TODO Limit to vim files only
" Easy safe and source file
map gr :w<cr>:so %<cr>

" Config
let g:startify_padding_left = 4
let g:startify_change_to_vcs_root = 1 " When opening a file or bookmark, seek and change to the root directory of the VCS (if there is one).

" Remove startheader
let g:startify_custom_header = []

" Bookmarks
let g:startify_bookmarks = [
    \ {'c': '~/.config/nvim/init.vim'},
    \ ]

" Commands
" let g:startify_commands = [
"         \ ':help reference',
"         \ ['Vim Reference', 'h ref'],
"         \ {'h': 'h ref'},
"         \ {'m': ['My magical function', 'call Magic()']},
"         \ ]
"" Add with:
"" \ { 'type': 'commands',  'header': ['    Commands']       },


" VimWiki tasks and releases
let s:vimwiki_tasks_location='$HOME/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/DearNova_projects/'
" Spacing for filename and file title (value must includes filename length)
let s:name_spacing_length=16

let s:files_cache = []
let s:cache_timeout_sec = 60 * 60 " 1h
let s:last_cache_time = 0

" Load and cache VimWiki files for Startify
" Supports force reload by giving '1' as argument
function StartifyVimWikiLoadFiles(...)
    let force_reload = get(a:, 1, 0)

    " Don't load files of not forces and cache is not timedout
    if force_reload != 1 && (localtime() - s:last_cache_time < s:cache_timeout_sec)
        return
    endif

    " Reset cache time
    let s:last_cache_time = localtime()

    let s:files = []

    " Uses stat because of a lack of way to get the file creation date
    for file_with_date in split(system('stat -f "%Sm+%N" -t "%Y-%m-%d %H:%M:%S" "' . s:vimwiki_tasks_location . '"*'), "\n")
        let parts = split(file_with_date, "+")
        
        if len(parts) != 2
            echom "Item does not have 2 parts: " . parts
            continue
        endif

        " Get file name by removing the path
        let file_name = substitute(parts[1], "/.*/", "", "")
        let first_line = system('head -1 "'. parts[1] . '"')
        call add(s:files, {
                    \ 'name': file_name,
                    \ 'date': parts[0],
                    \ 'description': substitute(first_line, '\n\+$', '', '')
                    \})
    endfor
    
    let s:files_cache = s:files
endfunction

function GroupOnCategory(file_match, group_match)
    call StartifyVimWikiLoadFiles()

    let files = {}

    " TODO change with filter
    for current_file in s:files_cache
        if current_file.name =~ a:file_match
            let category = matchstr(current_file.name, a:group_match)
            let items_in_category = get(files, category, [])
            call add(items_in_category, current_file)
            let files[category] = items_in_category
        endif
    endfor
    
    return files
endfunction

function Tasks()
    return GroupOnCategory('^\u\+-', '\(\zs\w\+\ze\).*')
endfunction

function Releases()
    return GroupOnCategory('^Release', 'Release\s\?\(\zs\w\+\ze\).*')
endfunction

function VimWikiCreateNewTask()
    call inputsave()
    let l:task_code = input('Enter task code (format JIRATASK-numer): ')
    call inputrestore()

    if len(l:task_code) == 0
        echoerr "ERROR: Incorrect Task format given"
        return
    endif

    " TODO check input and format (incl cancel)
    let l:file_name = l:task_code . ".wiki"
    let l:file_path = s:vimwiki_tasks_location . l:file_name

    " Edit new file
    execute "e " . l:file_path
    " If file is new, fille with task template
    if empty(expand(glob(l:file_path)))
        execute "0r ~/.config/nvim/templates/task.wiki"
        execute "w"
        call setline('.', '= ' . l:task_code . ' - {{DESCIPTION}} =')
        " Invalidate cache
        let s:last_cache_time = 0
    endif
endfunction

function s:compare_date(left, right)
    return a:left.date < a:right.date ? 1 : a:left.date > a:right.date ? -1 : 0
endfunction

" Comare on date of the first item in given lists
function s:compare_date_first_item(left_items, right_items)
    return s:compare_date(a:left_items[0], a:right_items[0])
endfunction

function s:sort_on_date(items)
    return sort(a:items, function('s:compare_date'))
endfunction

function s:recent_tasks()
    let items = [{'line': 'Create new Task', 'cmd': 'call VimWikiCreateNewTask()'}] " Has manual key 't'

    let item_lists = []
    " Sort all items for each category
    for [category, file_names] in items(Tasks())
        let sorted_items = s:sort_on_date(file_names)
        let item_lists += [sorted_items]
    endfor

    " Sort categories on date of first item
    let item_lists = sort(item_lists, function('s:compare_date_first_item'))

    " Map newest 3 items in catefory to single list
    for sorted_items in item_lists
        let items += map(sorted_items[:2], '{"line": v:val.date . " " . v:val.name . repeat(" ", s:name_spacing_length - len(v:val.name)) . v:val.description, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
    endfor
    return items
endfunction

function s:recent_releases()
    let items = []

    for [category, file_names] in items(Releases())
        let items += map(file_names[:2], '{"line": v:val.date . " " . v:val.name, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
       "let items += map(file_names, '{"line": v:val.name . " (". v:val.date .")\, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
        "for file_name in file_names
        "endfor
       "echo key . ': ' . value
    endfor
    return items
endfunction



" Build startpage
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['    Sessions']       },
    \ { 'type': function('s:recent_tasks'), 'header': ['    Tasks'], 'indices': ['t'] },
    \ { 'type': function('s:recent_releases'), 'header': ['    Releases'] },
    \ { 'type': 'files',     'header': ['    Most recent files']            },
    \ { 'type': 'dir',       'header': ['    Most recent files current dir: '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['    Bookmarks']      },
    \ ]
