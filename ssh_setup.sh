#!/bin/bash
echo "Enter Your email: "
read email 
echo "Welcome ${email}!"
ssh-keygen -t ed25519 -C "${email}"
eval "$(ssh-agent -s)"
if [ -f  .ssh/config ]; then
    echo "ssh config file already there"
else
    touch .ssh/config
    .ssh/config << "Host *"
    .ssh/config << "   AddKeysToAgent yes"
    .ssh/config << "   UseKeychain yes"
    .ssh/config << "   IdentityFile ~/.ssh/id_ed25519"
fi

gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub
