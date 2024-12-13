set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

clear

echo -e "$ascii_art"

#---

#gum log --structured --level info "Updating and upgrading the environment..."

sudo apt-get update && sudo apt-get upgrade -y

#---

#gum log --structured --level info "Installing curl..."

sudo apt-get install -y curl

#---

#gum log --structured --level info "Installing gum..."

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt-get update && sudo apt-get install -y gum

#---

echo ''
echo ':small_red_triangle: {{ Bold "Custom Setup" }} {{ Color "202" "is for fresh Ubuntu 24.04 installations only!" }}' | gum format -t template | gum format -t emoji
gum spin --spinner.foreground="202" --spinner minidot --title "Press Ctrl+C to abort..." -- sleep 5
echo ''

#---

echo ''
gum log --structured --level info "Installing Git..."
echo ''

sudo apt-get update && sudo apt-get install -y git

#---

echo ''
gum log --structured --level info "Cloning Custom Setup repository..."
echo ''

rm -rf ~/.local/share/custom-setup
git clone --quiet https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup

#---

echo ''
gum log --structured --level info "Starting customization..."
echo ''

source ~/.local/share/custom-setup/install.sh
