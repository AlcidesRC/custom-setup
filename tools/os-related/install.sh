gum log --structured --level info "Installing OS related tools..."
echo ''

# <eza> is a <ls> replacement (see aliases for further details)
sudo apt-get install -y eza

# <fd-find> is a <fd> replacement (see aliases for further details)
sudo apt-get install -y fd-find

# <fzf> is a <ff> replacement (see aliases for further details)
sudo apt-get install -y fzf

# <tilix> is a <terminal> replacement
sudo apt-get install -y tilix
source ~/.local/share/custom-setup/defaults/app-tilix.sh

# Install Gnome shell extensions
sudo apt-get install -y \
  gnome-tweaks \
  gnome-shell-extensions

# Install additional tools
sudo apt-get install -y \
  make \
  unzip
