echo -e "🔸 Installing OS-related tools..."

# <eza> is a <ls> replacement (see aliases for further details)
# <fd-find> is a <fd> replacement (see aliases for further details)
# <fzf> is a <ff> replacement (see aliases for further details)
sudo apt-get update >/dev/null && sudo apt-get install -y eza fd-find fzf make unzip >/dev/null