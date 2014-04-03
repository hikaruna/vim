git clone このリポジトリのURL
git submodule init
git submodule update
ln -s vim ~/.vim
ln -s ~/.vim/.vimrc ~/.

Vimはluaが有効のbrew製のやつをつかう
brew install --devel --with-lua

brewのアプリが先にPATHに引っかかるようにしておく
.bashrc 等
PATH="/usr/local/bin:$PATH"
iterm再起動

vim起動
プラグインをインストールするか聞かれるのでYes!

終わり
