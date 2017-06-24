# nqqvim

## install vim

    brew install vim --with-override-system-vi --with-python3 --with-lua

## install vimscript

    git clone https://github.com/bantana/nqqvim ~/.nqqvim
    ln -s ~/.nqqvim/.vimrc ~/.vimrc
    ln -s ~/.nqqvim/.vim ~/.vim

## install plugin

    vim +PlugInstall +qall

## install YouCompleteMe

    cd ~/.vim/plugged/YouCompleteMe/
    git submodule update --init --recursive
    python install.py  --clang-completer  --system-libclang --gocode-completer --racer-completer

