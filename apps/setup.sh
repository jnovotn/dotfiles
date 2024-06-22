#!/bin/sh

# install apps 

# math first
sudo apt install texlive
sudo apt install asymptote 
sudo apt install latexmk 

# fix a wierd issue with cargo needing an env file
sudo snap install rustup --classic
mkdir -p ~/.cargo
touch ~/.cargo/env
