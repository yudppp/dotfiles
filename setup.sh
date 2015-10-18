#!/bin/sh
go get -u github.com/nsf/gocode
go get -u code.google.com/p/rog-go/exp/cmd/godef
brew install ag

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle/

git clone https://github.com/Shougo/neobundle.vim.git neobundle.vim

ln -sf dotfiles/.vimrc .vimrc