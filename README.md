# dotfiles
My aliases, configuration, and setup scripts.

## install
Install git, rescursively clone the dotfiles, run the setup file:
```sh
sudo apt install git
git clone --recursive https://github.com/jnovotn/dotfiles.git
cd dotfiles
./setup.sh
```
Then for the git / ssh setup
```sh
./ssh_setup.sh
```

Then gui apps
```sh
./install_gui_apps.sh
```
