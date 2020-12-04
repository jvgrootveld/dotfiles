" VimWiki
" https://github.com/vimwiki/vimwiki
" ---------------------------------------

let vw_pages_path='$HOME/Library/Mobile Documents/com~apple~CloudDocs/vimwiki'
let vw_html_path='$HOME/Documents/vimwiki'
let vw_html_templates_path='$HOME/.vim/vimwiki/templates'
" let g:vimwiki_rxTodo = '\C\<\%(TODO\|DONE\|STARTED\|FIXED\|XXX\|WAITING\sFOR\)\>'

let g:vimwiki_list = [
  \{'path': vw_pages_path.'/DearNova_projects/',
  \ 'nested_syntaxes': {'sh': 'sh', 'java': 'java'},
  \ 'path_html': vw_html_path.'/DearNova_projects_html/',
  \ 'template_path': vw_html_templates_path,
  \ 'template_default': 'default',
  \ 'template_ext': '.html'
  \},
  \{'path': vw_pages_path.'/DearNova_general/',
  \ 'path_html': vw_html_path.'/DearNova_general_html/',
  \ 'template_path': vw_html_templates_path,
  \ 'template_default': 'default',
  \ 'template_ext': '.html'
  \},
  \{'path': vw_pages_path.'/knowledge_base/',
  \ 'path_html': vw_html_path.'/knowledge_base_html/',
  \ 'template_path': vw_html_templates_path,
  \ 'template_default': 'default',
  \ 'template_ext': '.html'
  \},
  \{'path': vw_pages_path.'/MyMiniatures/',
  \ 'path_html': vw_html_path.'/MyMiniatures_html/',
  \ 'template_path': vw_html_templates_path,
  \ 'template_default': 'default',
  \ 'template_ext': '.html'
  \},
  \{'path': vw_pages_path.'/scratch/',
  \ 'path_html': vw_html_path.'/scratch_html/',
  \ 'template_path': vw_html_templates_path,
  \ 'template_default': 'default',
  \ 'template_ext': '.html'
  \}
\]

" Vim-templates
let g:tmpl_search_paths = ['~/.vim/templates']
" Default varables
let g:tmpl_author_name = 'Justin van Grootveld'           " {{NAME}}
let g:tmpl_author_email = 'justin.vangrootveld@gmail.com' " {{EMAIL}}
let g:tmpl_company = 'DearNova'                           " {{COMPANY}}
