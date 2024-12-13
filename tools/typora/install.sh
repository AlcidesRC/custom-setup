echo ':small_orange_diamond: Installing {{ Bold "Typora" }}' | gum format -t template | gum format -t emoji
echo ''

wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc

# Add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'

# Update software package repositories
sudo apt-get update -y && sudo apt-get install -y typora