# nqqvim

## Install vim

    brew install vim --with-override-system-vi --with-python3 --with-lua

## Install vimscript

    git clone https://github.com/bantana/nqqvim ~/.nqqvim
    ln -s ~/.nqqvim/.vimrc ~/.vimrc
    ln -s ~/.nqqvim/.vim ~/.vim

## Install plugin

    vim +PlugInstall +qall

## Install YouCompleteMe

    cd ~/.vim/plugged/YouCompleteMe/
    git submodule update --init --recursive
    python install.py  --clang-completer  --system-libclang --gocode-completer --racer-completer


## Install vim-go

first:

    :GoInstallBinaries

update:

    :GoUpdateBinaries

## have fun!
