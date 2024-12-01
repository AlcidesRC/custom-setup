wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc >/dev/null
sudo add-apt-repository -y 'deb https://typora.io/linux ./' >/dev/null
sudo apt update -y >/dev/null && sudo apt install -y typora >/dev/null
