[ -e ~/.bash_aliases ] && unlink ~/.bash_aliases

ln -s ~/.local/share/custom-setup/defaults/bash/aliases ~/.bash_aliases

source ~/.bashrc
