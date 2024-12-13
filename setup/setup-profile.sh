echo ':small_orange_diamond: Setup {{ Bold "Bash Profile" }}' | gum format -t template | gum format -t emoji
echo ''

# Remove any previous symbolic link
[ -e ~/.bash_profile ] && unlink ~/.bash_profile

# Create the symbolic link
ln -s ~/.local/share/custom-setup/defaults/bash/profile ~/.bash_profile

# Reload the bashrc
source ~/.bashrc
