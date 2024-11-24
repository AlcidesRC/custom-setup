sudo apt update -y && sudo apt upgrade -y && sudo apt install -y \
  curl

curl -sS https://starship.rs/install.sh | sh

echo 'eval "$(starship init bash)"' >> ~/.bashrc

starship preset pastel-powerline -o ~/.config/starship.toml
