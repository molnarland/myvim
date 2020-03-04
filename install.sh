git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall

sudo apt install -y build-essential cmake python3-dev
cd ~/.config/nvim/bundle/YouCompleteMe
python3 install.py --all
cd -
