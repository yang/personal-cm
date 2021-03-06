" Use <https://github.com/bling/dotvim>
" Disable AutoPairs
let g:AutoPairsLoaded = 1
let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.plugin_groups_exclude = []
source ~/.vim/vimrc
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:ctrlp_open_new_file = 'r'
set guifont=Monaco:h13
set visualbell t_vb= " Disable beeping
set tabstop=2 shiftwidth=2
set noignorecase
set hlsearch

" <http://calebthompson.io/crontab-and-vim-sitting-in-a-tree/>
autocmd filetype crontab setlocal nobackup nowritebackup

nmap <space> <c-f>
" Should work everywhere
nmap <leader><space> <c-b>
" Only works in GUI like MacVim or GVim
nmap <s-space> <c-b>
" Works in VimR (weird one)
nmap <c-space> <c-b>

" Underline with ---
nmap <leader>mh yypVr-
" Underline with ===
nmap <leader>mH yypVr=

nnoremap <silent> <leader><leader> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> <leader>b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
nunmap <BS>
nnoremap [ctrlp]m :CtrlPMixed<cr>

" Disable bling's search regex
nunmap /
vunmap /
nunmap ?
vunmap ?
nunmap :s/

nmap <left> h
nmap <right> l
nmap <up> k
nmap <down> j

nnoremap <leader>Fw :grep <cword> 
nnoremap grr :silent grep -s -w <cword> .<cr>:copen<cr>
nnoremap grc :silent grep -i -w <cword> .<cr>:copen<cr>
nnoremap grl :silent grep -i <cword> .<cr>:copen<cr>



" Useful shortcuts:
" grep current word: ,fw
