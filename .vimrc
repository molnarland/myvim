set number

syntax on
"filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

"Ctrl-j deletes the line below the current line, if it is blank. 
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"Ctrl-k deletes the line above the current line, if it is blank. 
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>


"---------------- vundle --------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


try
    call vundle#begin()
catch
    !~/.vim/install.sh
    call vundle#begin()
endtry
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
if has('python3')
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'digitaltoad/vim-pug'
Plugin 'posva/vim-vue'
Plugin 'jwalton512/vim-blade'
Plugin 'flowtype/vim-flow'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line

"---------------- vundle --------------

"----------- plugins are loaded -------

"for codedark color
set t_Co=256
set t_ut=
set enc=utf-8
set guifont=Powerline_Consolas:h11
set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
colorscheme codedark

"for pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

"for airline
let g:airline_theme = 'codedark'
let g:javascript_plugin_flow = 1

"for nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowHidden = 1

"for vim-vue
autocmd FileType vue syntax sync fromstart

" HELPS
" - switch between tab of NERD and file 
"       -> normal mode: Ctrl+ww
"       -> https://stackoverflow.com/questions/1656591/how-to-jump-back-to-nerdtree-from-file-in-tab#answer-4419041
