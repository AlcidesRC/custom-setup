echo ':small_orange_diamond: Installing {{ Bold "OS-related tools" }}' | gum format -t template | gum format -t emoji
echo ''

# <eza> is a <ls> replacement (see aliases for further details)
# <fd-find> is a <fd> replacement (see aliases for further details)
# <fzf> is a <ff> replacement (see aliases for further details)
# <tilix> is a <terminal> replacement
sudo apt-get install -y
  eza \
  fd-find \
  fzf \
  gnome-tweaks \
  gnome-shell-extensions \
  make \
  tilix \
  unzip

source ~/.local/share/custom-setup/defaults/app-tilix.sh

echo ''
