" Go to file under cursor: `gf`
" Go back with `<C+^>`
source $HOME/.config/nvim/config/options.vim
source $HOME/.config/nvim/config/plugins.vim

" Load custom plugin config
for f in split(glob('$HOME/.config/nvim/config/plugin_*.vim'), '\n')
    exe 'source' f
endfor

source $HOME/.config/nvim/config/keys.vim

" Load custom functions
for f in split(glob('$HOME/.config/nvim/functions/*.vim'), '\n')
    exe 'source' f
endfor

" TODO (in different folder)
" - Functions
" - Snippets

