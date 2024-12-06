set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

echo -e "$ascii_art"

#---

# Update the OS
sudo apt-get update >/dev/null && sudo apt-get upgrade -y >/dev/null

#---

echo -e "🔸 Installing Gum..."
sudo apt-get install -y curl >/dev/null
sudo mkdir -p /etc/apt/keyrings
[ -e /etc/apt/keyrings/charm.gpg ] && sudo rm /etc/apt/keyrings/charm.gpg
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list >/dev/null
sudo apt-get update >/dev/null && sudo apt-get install -y gum >/dev/null

#---

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 80 --margin "1 2" --padding "2 4" \
	'Custom Setup' 'is for fresh Ubuntu 24.04 installations only!'

gum spin --spinner dot --title "🔹 Begin installation (or abort with ctrl+c)..." -- sleep 5

#---

echo -e "🔸 Installing Git tool..."
sudo apt-get install -y git >/dev/null

echo -e "🔸 Cloning Custom Setup..."
rm -rf ~/.local/share/custom-setup
git clone --quiet https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup

echo -e "🔸 Installation starting..."
source ~/.local/share/custom-setup/install.sh
