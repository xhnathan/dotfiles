#!/bin/bash

# 检查并安装 zsh
if ! command -v zsh &> /dev/null; then
    # 根据您的操作系统和包管理器更改以下命令
    sudo apt-get install zsh
fi

# 检查并安装 oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 克隆或更新仓库
if [ -d "$HOME/dotfiles" ]; then
    cd $HOME/dotfiles
    git pull
else
    git clone https://github.com/xhnathan/dotfiles.git $HOME/dotfiles
fi

# 复制 .zshrc
cp $HOME/dotfiles/.zshrc $HOME/

# 复制 custom 目录
cp -r $HOME/dotfiles/custom/* $HOME/.oh-my-zsh/custom/
