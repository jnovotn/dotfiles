#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

# install the zsh plugins
ZSH_PLUGIN_DIR=${BASEDIR}/.oh-my-zsh/custom/plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_PLUGIN_DIR}/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_PLUGIN_DIR}/zsh-syntax-highlighting
git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_PLUGIN_DIR}/fzf-zsh-plugin
git clone https://github.com/agkozak/zsh-z.git ${ZSH_PLUGIN_DIR}/zsh-z
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_PLUGIN_DIR}/zsh-history-substring-search
curl -sS https://starship.rs/install.sh | sh

# tmux
ln -s ${BASEDIR}/.tmux/.tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/tmux.conf.local ~/.tmux.conf.local

# git
#ln -s ${BASEDIR}/gitconfig ~/.gitconfig
