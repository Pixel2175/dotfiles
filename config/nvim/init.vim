call plug#begin('~/local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

"source ~/.config/nvim/config/nvimtree.vim


set number
set noswapfile
set fillchars+=eob:\ 

cnoreabbrev i PlugInstall
cnoreabbrev q q!
cnoreabbrev coc CocInstall

colorscheme retrobox

inoremap <C-s> <Esc>:w<CR>
inoremap <silent><expr> <Space> coc#pum#visible() ? coc#pum#confirm() : "<Space>"


nnoremap <C-s> <Esc>:w<CR>
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-a> gg<S-v>G
nnoremap <C-j> :m .+1<CR>==

