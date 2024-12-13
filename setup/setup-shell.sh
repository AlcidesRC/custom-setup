echo ':small_orange_diamond: Setup {{ Bold "Shell" }}' | gum format -t template | gum format -t emoji
echo ''

# Setup shell only once
if ! grep -q "source ~/.local/share/custom-setup/defaults/bash/shell" ~/.bashrc; then
  # Add required setup to bashrc
  echo "source ~/.local/share/custom-setup/defaults/bash/shell" >> ~/.bashrc

  # Reload the bashrc
  source ~/.bashrc
fi
