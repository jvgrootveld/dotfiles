" Open first matching jira task
let g:dn_jira_base_url = "https://issues.dearnova.nl/browse/"

" Finds first jira task based on regex '[a-Z]+-[0-9]+' and open it in the
" default browser.
" Note: 'redraw!' is needed because of the silent exec. Else the whole
" terminal screen is empty.
function! OpenFirstMatchingJiraTask()
  let foundTask = matchstr(getline("."), '\w\+-\d\+')
  echo foundTask
  if foundTask != ""
    silent exec "!open '".g:dn_jira_base_url.foundTask."'"
    redraw!
  else
    echo "No Jira Task found in line."
  endif
endfunction
map <leader>j :call OpenFirstMatchingJiraTask()<cr>
