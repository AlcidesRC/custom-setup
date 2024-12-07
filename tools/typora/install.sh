wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc >/dev/null

# Add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./' >/dev/null

# Update software package repositories
sudo apt-get update -y >/dev/null

# install typora
sudo apt-get install -y typora >/dev/null