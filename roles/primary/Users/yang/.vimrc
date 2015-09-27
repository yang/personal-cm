" Use <https://github.com/bling/dotvim>
let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.plugin_groups_exclude = []
source ~/.vim/vimrc
set guifont=Monaco:h13
set visualbell t_vb= " Disable beeping
nmap <leader><space> <c-b> " Should work everywhere
nmap <s-space> <c-b> " Only works in GUI like MacVim or GVim
nmap <c-space> <c-b> " Works in VimR (weird one)
nmap <space> <c-f>
nmap <leader>mh yypVr- " Underline with ---
nmap <leader>mH yypVr= " Underline with ===
nnoremap <silent> <leader><leader> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> <leader>b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
nunmap <BS>
