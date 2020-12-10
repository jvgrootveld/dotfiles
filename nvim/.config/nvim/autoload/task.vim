" Helper functions for tasks and releases.
"
" These functions are used in Startify and FZF to search
" tasks and releases in the VimWiki folder.


" VimWiki tasks and releases
let s:vimwiki_tasks_location='$HOME/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/DearNova_projects/'
" Spacing for filename and file title (value must includes filename length)
let s:name_spacing_length=16

let s:files_cache = []
let s:cache_timeout_sec = 60 * 60 " 1h
let s:last_cache_time = 0

let s:file_cache_path = glob('$HOME/') . '.jvgvimtaskscache'

function! task#saveCache()
    let l:cache_data = {
                \ 'files': s:files_cache,
                \ 'time': s:last_cache_time,
                \ }
    call writefile([string(l:cache_data)], s:file_cache_path, 'b')
endfunction

function! task#loadCache() abort
    if !filereadable(s:file_cache_path)
        return
    endif
    " Load raw data as string
    let l:cache_data = readfile(s:file_cache_path, "b")[0]
    " Interpret string as code
    " See https://stackoverflow.com/a/31350133/874249
    execute "let l:cache_data = " . l:cache_data
    " Set variables
    let s:files_cache = l:cache_data.files
    let s:last_cache_time = l:cache_data.time
endfunction

" Load and caches files founnd in task folder
" One entry has the following variables:
"
"   name          Filename
"   date          File creationn date
"   description   The first line of the file content
" 
" Supports force reload by giving '1' as argument
function! task#loadFiles(...) abort
    let l:force_reload = get(a:, 1, v:false)

    " Don't load files of not l:forces and cache is not timedout
    if l:force_reload != 1 && (localtime() - s:last_cache_time < s:cache_timeout_sec)
        return
    endif

    " Reset cache time
    let s:last_cache_time = localtime()

    let l:files = []

    " Uses stat because of a lack of way to get the file creation date
    for file_with_date in split(system('stat -f "%Sm+%N" -t "%Y-%m-%d %H:%M:%S" "' . s:vimwiki_tasks_location . '"*'), "\n")
        let l:parts = split(file_with_date, "+")

        if len(l:parts) != 2
            echom "Item does not have 2 parts: " . l:parts
            continue
        endif

        " Get file name by removing the path
        let l:file_name = substitute(l:parts[1], "/.*/", "", "")
        let l:first_line = system('head -1 "'. l:parts[1] . '"')
        call add(l:files, {
                    \ 'name': l:file_name,
                    \ 'date': l:parts[0],
                    \ 'description': substitute(l:first_line, '\n\+$', '', '')
                    \})
    endfor

    let s:files_cache = l:files
    call task#saveCache()
endfunction

" Create new Task with template
" Asks for task code
function! task#newTask() abort
    call inputsave()
    let l:task_code = input('Enter task code (format JIRATASK-numer): ')
    call inputrestore()

    if len(l:task_code) == 0
        return
    endif

    if l:task_code !~ '^\a\+-'
        echoerr "ERROR: Incorrect Task format given"
        return
    endif

    let l:task_code = toupper(l:task_code)
    let l:file_name = l:task_code . ".wiki"
    let l:file_path = s:vimwiki_tasks_location . l:file_name

    " Edit new file
    execute "e " . l:file_path
    " If file is new, fill with template
    if empty(expand(glob(l:file_path)))
        execute "0r ~/.config/nvim/templates/task.wiki"
        execute "w"
        call setline('.', '= ' . l:task_code . ' - {{DESCIPTION}} =')
        " Invalidate cache
        let s:last_cache_time = 0
    endif
endfunction

" Create new Release with template
" Asks for release name
function! task#newRelease() abort
    call inputsave()
    let l:release_name = input('Enter Release (format Release PROJ version): ')
    call inputrestore()

    if len(l:release_name) == 0
        return
    endif

    if l:release_name !~ '^Release\s\u\+\s'
        echoerr "ERROR: Incorrect Release format given. Example 'Release MOP 1.24"
        return
    endif

    let l:file_name = l:release_name . ".wiki"
    let l:file_path = s:vimwiki_tasks_location . l:file_name

    " Edit new file
    execute "e " . l:file_path
    " If file is new, fill with template
    if empty(expand(glob(l:file_path)))
        execute "0r ~/.config/nvim/templates/release.wiki"
        execute "w"
        call setline('.', '= ' . l:release_name . ' =')
        " Invalidate cache
        let s:last_cache_time = 0
    endif
endfunction

" Filter all files in task folder on 'file_match' regex
" and group them with the first group in the 'group_match' regex
" (must contain a group))
" Example:
"
" # file_match
" Filters files starting with uppercase characters and '-'
"   
"   '^\u\+-'
"
" # group_match
" Groups on first word
"   
"   '\(\zs\w\+\ze\).*'
"
" # Result example
" {
"   'MOP': [.. list of file entries],
"   'BRMT': [.. list of file entries],
" }
"
function! s:groupOnCategory(file_match, group_match)
    call task#loadFiles()

    let l:files = {}

    for current_file in s:files_cache
        if current_file.name =~ a:file_match
            let l:category = matchstr(current_file.name, a:group_match)
            let l:items_in_category = get(l:files, l:category, [])
            call add(l:items_in_category, current_file)
            let l:files[l:category] = l:items_in_category
        endif
    endfor

    return l:files
endfunction

" Get all tasks
function! task#tasks()
    return s:groupOnCategory('^\u\+-', '\(\zs\w\+\ze\).*')
endfunction

" Get al release files
function! task#releases()
    return s:groupOnCategory('^Release', 'Release\s\?\(\zs\w\+\ze\).*')
endfunction

" Helper function to compare two dates
function! s:compare_date(left, right)
    return a:left.date < a:right.date ? 1 : a:left.date > a:right.date ? -1 : 0
endfunction

" Sort all items for each category
" And sort categories on date of first item
function! s:sort_items_and_categories(category_with_items)
    let l:item_lists = []
    " Sort all items for each category
    for [category, file_names] in items(a:category_with_items)
        let sorted_items = sort(file_names, {a, b -> s:compare_date(a, b)})
        let l:item_lists += [sorted_items]
    endfor

    " Sort categories on date of first item
    return sort(l:item_lists, {a, b -> s:compare_date(a[0], b[0])})
endfunction

" Get recent tasks
" Returns the first 3 items of every category
function! task#recentTasks()
    let l:items = [{'line': 'Create new Task', 'cmd': 'call task#newTask()'}] " Has manual key 't'

    " Map newest 3 items in catefory to single list
    for sorted_items in s:sort_items_and_categories(task#tasks())
        let l:items += map(sorted_items[:2], '{"line": v:val.name . repeat(" ", s:name_spacing_length - len(v:val.name)) . v:val.description, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
    endfor

    return l:items
endfunction

" Get recent releases
" Returns the first 3 items of every category
function! task#recentReleases()
    let l:items = [{'line': 'Create new Release', 'cmd': 'call task#newRelease()'}] " Has manual key 'r'

    " Map newest 3 items in catefory to single list
    for sorted_items in s:sort_items_and_categories(task#releases())
        let l:items += map(sorted_items[:2], '{"line": v:val.name, "cmd": "edit " . s:vimwiki_tasks_location . v:val.name}')
    endfor

    return l:items
endfunction

