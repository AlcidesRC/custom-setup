if ! grep -q "source ~/.local/share/custom-setup/defaults/bash/shell" ~/.bashrc; then
  # Add required setup to bashrc
  echo "source ~/.local/share/custom-setup/defaults/bash/shell" >> ~/.bashrc

  # Reload the bashrc
  source ~/.bashrc
fi
