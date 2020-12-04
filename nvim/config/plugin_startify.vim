" Startify
" https://github.com/mhinz/vim-startify
" ---------------------------------------

"" Config
let g:startify_padding_left = 4
let g:startify_change_to_vcs_root = 1 " When opening a file or bookmark, seek and change to the root directory of the VCS (if there is one).

"" Remove startheader
let g:startify_custom_header = []

"" Bookmarks
let g:startify_bookmarks = [
    \ {'c': '~/.config/nvim/init.vim'},
    \ ]

"" Commands
let g:startify_commands = [
        \ ':help reference',
        \ ['Vim Reference', 'h ref'],
        \ {'h': 'h ref'},
        \ {'m': ['My magical function', 'call Magic()']},
        \ ]

"" WIP VinWiki tasks and releases
let s:vimwiki_tasks_location='$HOME/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/DearNova_projects/'

"" If need to exclude directories check:
"" stat -f "%T+%Sm+%N" -t "%Y-%m-%d %H:%M:%S" * | grep -v /

"" TODO
"" Rename functions to localscope (Some global for FZF use)
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

function Tasks()
    call StartifyVimWikiLoadFiles()

    let files = {}

    " TODO change with filer
    for current_file in s:files_cache
        if current_file.name =~ '^\u\+-'
            let category = matchstr(current_file.name, '\(\zs\w\+\ze\).*')
            let items_in_category = get(files, category, [])
            call add(items_in_category, current_file)
            let files[category] = items_in_category
        endif
    endfor
    
    return files
endfunction

function Releases()
    return {}
endfunction

" function Tasks()
"     let files = {}
" 
"     for file_with_date in split(system('stat -f "%Sm+%N" -t "%Y-%m-%d %H:%M:%S" "' . s:vimwiki_tasks_location . '"*'), "\n")
"         let parts = split(file_with_date, "+")
"         
"         if len(parts) != 2
"             echom "parts don't have 2 parts: " . parts
"             continue
"         endif
" 
"         let file_name = substitute(parts[1], "/.*/", "", "")
"         let category = matchstr(file_name, '\(\zs\w\+\ze\).*')
"         let items_in_category = get(files, category, [])
"         call add(items_in_category, {'name': file_name, 'date': parts[0]})
"         let files[category] = items_in_category
"     endfor
"     
"     return files
" endfunction

"function Releases()
"    let files = {}
"
"    for file_path in split(glob(s:vimwiki_tasks_location.'*'), '\n')
"        let file_name = substitute(file_path, "/.*/", "", "")
"        let creation_date = system('stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "' . file_path . '"')
"        let creation_date = substitute(creation_date, '\n\+$', '', '')
"        if file_name =~ '^Release'
"            let category = matchstr(file_name, 'Release\s\?\(\zs\w\+\ze\).*')
"            let items_in_category = get(files, category, [])
"            call add(items_in_category, {'name': file_name, 'date': creation_date})
"            let files[category] = items_in_category
"
"        endif
"    endfor
"    
"    return files
"endfunction

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

    execute "e " . l:file_path

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

function s:sort_on_date(items)
    return sort(a:items, function('s:compare_date'))
endfunction

let s:name_spacing_length=16
function s:recent_tasks()
    let items = [{'line': 'Create new Task', 'cmd': 'call VimWikiCreateNewTask()'}]
    " TODO IDEA:
    " define an sorted categories list
    " Loop over categories and get tasks
    " Loop again and handle the rest
    for [category, file_names] in items(Tasks())
        let sorted_items = s:sort_on_date(file_names)
        let items += map(sorted_items[:2], '{"line": v:val.date . " " . v:val.name . repeat(" ", s:name_spacing_length - len(v:val.name)) . v:val.description, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
        "endfor
       "echo key . ': ' . value
    endfor
    return items
endfunction

function s:recent_releases()
    let items = []

    for [category, file_names] in items(Releases())
       let items += map(file_names, '{"line": v:val.name . " (". v:val.date .")\, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
        "for file_name in file_names
        "endfor
       "echo key . ': ' . value
    endfor
    return items
endfunction


"echo Tasks()
" TODO Limit to vim files only
map gr :w<cr>:so %<cr>

function s:foobar()
    return [
          \ { 'line': 'foo', 'cmd': 'echo "FOO!"' },
          \ { 'line': 'bar', 'cmd': 'echo "BAR!"' },
          \ ]
  endfunction

"" Build startpage
let g:startify_lists = [
    \ { 'type': function('s:recent_tasks'), 'header': ['    Tasks'], 'indices': ['t'] },
    \ { 'type': function('s:recent_releases'), 'header': ['    Releases'] },
    \ { 'type': 'sessions',  'header': ['    Sessions']       },
    \ { 'type': 'files',     'header': ['    Most recent files']            },
    \ { 'type': 'dir',       'header': ['    Most recent files current dir: '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['    Bookmarks']      },
    \ { 'type': 'commands',  'header': ['    Commands']       },
    \ ]

"" TODO
" - Custom list https://github.com/mhinz/vim-startify/wiki/Example-configurations
" - Intergrate with VimWiki and last items (release, Jira tasks)
