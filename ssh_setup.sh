#!/bin/bash
SSH_KEY=~/.ssh/id_ed25519.pub
if [ ! -f  ${SSH_KEY} ]; then
   echo "Generating Key: "
   echo "Enter Your email: "
   read email 
   echo "Welcome ${email}!"
   ssh-keygen -t ed25519 -C "${email}"
   eval "$(ssh-agent -s)"
fi
SSH_CONFIG_FILE=~/.ssh/config
if [ -f  ${SSH_CONFIG_FILE} ]; then
    echo "ssh config file already there"
else
    touch ${SSH_CONFIG_FILE}
    echo "Host *" >> ${SSH_CONFIG_FILE}
    echo "   AddKeysToAgent yes" >> ${SSH_CONFIG_FILE}
    echo "   UseKeychain yes" >> ${SSH_CONFIG_FILE}
    echo "   IdentityFile ~/.ssh/id_ed25519" >> ${SSH_CONFIG_FILE}
fi

gh auth login
gh ssh-key add ${SSH_KEY}
git remote rename origin old_origin
git remote add origin git@github.com:jnovotn/dotfiles.git
