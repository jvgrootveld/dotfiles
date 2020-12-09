" Go to file under cursor: `gf`
" Go back with `<C+^>`
source $HOME/.config/nvim/config/options.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/keys.vim

" Load custom functions
for f in split(glob('$HOME/.config/nvim/functions/*.vim'), '\n')
    exe 'source' f
endfor

" TODO (in different folder)
" - Functions
" - Snippets

command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)
