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
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
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
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
if has('python3')
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'digitaltoad/vim-pug'
Plugin 'posva/vim-vue'
Plugin 'jwalton512/vim-blade'
" Plugin 'flowtype/vim-flow'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'jparise/vim-graphql'
Plugin 'gabrielelana/vim-markdown'
Plugin 'vim-syntastic/syntastic'
Plugin 'wincent/ferret'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'google/vim-searchindex'
Plugin 'terryma/vim-multiple-cursors'


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
set t_ut=
set enc=utf-8
" set guifont=Powerline_Consolas:h11
" set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
colorscheme codedark

" for pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" for airline
let g:airline_theme = 'codedark'
let g:javascript_plugin_flow = 1

" for nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.swp']
map :nerd<CR> :NERDTreeToggle<CR>

" for vim-vue
autocmd FileType vue syntax sync fromstart

" for vim-commentary
nnoremap <C-í> gcc

" for fzf
set rtp+=~/.fzf
nmap :fzf :FZF

" for ferret
nmap :ack :Ack
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for multiple-cursors
let g:multi_cursor_use_default_mapping = 0

let g:multi_cursor_start_word_key      = '<C-b>'
let g:multi_cursor_select_all_word_key = '<A-b>'
let g:multi_cursor_start_key           = 'g<C-b>'
let g:multi_cursor_select_all_key      = 'g<A-b>'
let g:multi_cursor_next_key            = '<C-b>'
let g:multi_cursor_prev_key            = '<C-i>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" HELPS
" - switch between tab of NERD and file 
"       -> normal mode: Ctrl+ww
"       -> https://stackoverflow.com/questions/1656591/how-to-jump-back-to-nerdtree-from-file-in-tab#answer-4419041
