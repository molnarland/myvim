set number

syntax on
" filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=120

" Ctrl-j deletes the line below the current line, if it is blank. 
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" Ctrl-k deletes the line above the current line, if it is blank. 
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" Ctrl-j/k/l/h move cursor to another split
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" Tab navigation
nnoremap <Leader>p :tabprevious<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>t :tabnew<CR>
" map :W and :Q
nmap :W :w
nmap :Q :q

" ---------------- vundle --------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
let bundleDir='~/.config/nvim/bundle'

try
    call vundle#begin(bundleDir)
catch
    !~/.config/nvim/install.sh
    call vundle#begin(bundleDir)
endtry
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tomasiser/vim-code-dark' " theme
Plugin 'itchyny/lightline.vim' " bottom lime
Plugin 'scrooloose/nerdtree' " file explorer
Plugin 'Xuyuanp/nerdtree-git-plugin' " git icons to nerdtree
Plugin 'ryanoasis/vim-devicons' " icons to nerdtree
Plugin 'airblade/vim-gitgutter' " signs for git changes to editor
Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install --frozen-lockfile'} " finder and code completion
Plugin 'pangloss/vim-javascript' " js syntax highlight
Plugin 'Quramy/vim-js-pretty-template' " js template string highlight
Plugin 'jason0x43/vim-js-indent' " embedded js/ts highlight
Plugin 'leafgarland/typescript-vim' " ts syntax highlight
Plugin 'ianks/vim-tsx' " tsx syntax highlight
Plugin 'jparise/vim-graphql' " graphql syntax highlight
Plugin 'gabrielelana/vim-markdown' " markdown environment
Plugin 'vim-syntastic/syntastic' " syntax checker
Plugin 'tpope/vim-commentary' " can comment by type gcc
Plugin 'google/vim-searchindex' " shows how many times a search pattern occurs
Plugin 'mg979/vim-visual-multr', {'branch': 'master'} " multicursor
Plugin 'tpope/vim-surround' " surround https://catonmat.net/vim-plugins-surround-vim
Plugin 'dense-analysis/ale' " linting and prettify after save by eslint

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
"  :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"  auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------------- vundle --------------

" ----------- plugins are loaded -------

" for codedark colour
set t_Co=256
set cursorline
set t_ut=
" set guifont=Powerline_Consolas:h11
" set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
colorscheme codedark
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" for pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" for lightline
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ }

" for nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeIgnore=['\.swp', '\.idea']
let g:NERDTreeStatusline = ''
map :nerd<CR> :NERDTreeToggle<CR>

" for vim-vue
autocmd FileType vue syntax sync fromstart

" for vim-commentary
nnoremap <C-í> gcc

" for fzf
" C-t, C-x, C-v
" set rtp+=~/.fzf
nnoremap <C-s> :Files<CR>
nmap :Rg :rg

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" coc
let g:coc_node_path = '/home/rolandmolnar/.nvm/versions/node/v14.15.0/bin/node'
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-lists']


" ale
let g:ale_fix_on_save = 1
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)


" HELPS
" - switch between tab of NERD and file 
"       -> normal mode: Ctrl+ww
"       -> https://stackoverflow.com/questions/1656591/how-to-jump-back-to-nerdtree-from-file-in-tab#answer-4419041
