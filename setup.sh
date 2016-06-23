#!/bin/sh
go get -u github.com/nsf/gocode
brew install mercurial
# go get -u code.google.com/p/rog-go/exp/cmd/godef
go get -u github.com/kr/godep
go get -u golang.org/x/tools/cmd/gorename

brew install ag

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle/

git clone https://github.com/Shougo/neobundle.vim.git neobundle.vim

ln -sf dotfiles/.vimrc .vimrc

git config --global alias.br branch
git config --global alias.ba branch -a
git config --global alias.co checkout
git config --global alias.cp cherry-pick
git config --global alias.st status
