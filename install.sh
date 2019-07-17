#!/usr/bin/bash
echo `mkdir -p ~/.config/nvim`
echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc" > ~/.config/nvim/init.vim
echo `mkdir -p ~/.vim/after ~/.vim/.swp ~/.vim/.backup ~/.vim/.undo`
echo `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
echo `cp vimrc ~/.vimrc`
echo `nvim +PlugInstall +qa`
echo `nvim -c "CocInstall coc-ccls coc-python coc-pairs" +qa`
echo `cp coc-settings.json ~/.config/nvim/coc-settings.json`
