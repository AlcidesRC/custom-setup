sudo apt update -y && sudo apt upgrade -y && sudo apt install -y \
  curl

# Install Starship.rs
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Setup the new shell
grep -qxF 'eval "$(starship init bash)"' ~/.bashrc || echo 'eval "$(starship init bash)"' >> ~/.bashrc

# Setup the Pastel-Powerline as preset
starship preset pastel-powerline -o ~/.config/starship.toml

# Reload the shell
exec env -i HOME=$HOME bash -l
