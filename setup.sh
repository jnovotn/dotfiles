#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# $1 == the file to link from
# $2 == the file to link to 
function safe_link () {
if [ -f "$2" ] || [ -d "$2" ]; then
    echo "$2 exists."
    mv "$2" "$2.old" 
    ln -s "$1" "$2"
else 
    ln -s "$1" "$2"
fi
}

safe_link ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
#ln -s ${BASEDIR}/zshrc ~/.zshrc
safe_link ${BASEDIR}/zshrc ~/.zshrc

# install the zsh plugins
OMZ=${BASEDIR}/.oh-my-zsh
ZSH_PLUGIN_DIR=${OMZ}/custom/plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_PLUGIN_DIR}/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_PLUGIN_DIR}/zsh-syntax-highlighting
git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_PLUGIN_DIR}/fzf-zsh-plugin
git clone https://github.com/agkozak/zsh-z.git ${ZSH_PLUGIN_DIR}/zsh-z
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_PLUGIN_DIR}/zsh-history-substring-search
safe_link ${OMZ} ~/.oh-my-zsh
curl -sS https://starship.rs/install.sh | sh

if [[ $OSTYPE == 'darwin'* ]]; then 
    brew install exa
else 
    apt install exa
fi

# tmux
#ln -s ${BASEDIR}/.tmux/.tmux.conf ~/.tmux.conf
safe_link ${BASEDIR}/.tmux/.tmux.conf ~/.tmux.conf
#ln -s ${BASEDIR}/tmux.conf.local ~/.tmux.conf.local
safe_link ${BASEDIR}/tmux.conf.local ~/.tmux.conf.local

# git
#ln -s ${BASEDIR}/gitconfig ~/.gitconfig
