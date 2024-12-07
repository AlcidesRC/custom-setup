set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

clear

echo -e "$ascii_art"

#---

# Update and upgrade the OS
sudo apt-get update >/dev/null && sudo apt-get upgrade -y >/dev/null

#---

echo ''
echo ':small_orange_diamond: Starting the installation' | gum format -t emoji
echo ''

#---

sudo apt-get install -y curl >/dev/null
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list >/dev/null
sudo apt-get update >/dev/null && sudo apt-get install -y gum >/dev/null

#---

echo ''
echo ':small_red_triangle: {{ Bold "Custom Setup" }} {{ Italic "is for fresh Ubuntu 24.04 installations only!" }}' | gum format -t template | gum format -t emoji
gum spin --spinner dot --title "Press Ctrl+c to abort" -- sleep 5
echo ''

#---

echo ':small_blue_diamond: Installing Git' | gum format -t emoji
sudo apt-get install -y git >/dev/null

GIT_USERNAME=$(gum input --placeholder "What is your preferred user name for Git?")
git config --global user.name "$GIT_USERNAME"

GIT_EMAIL=$(gum input --placeholder "What is your preferred email address for Git?")
git config --global user.email "$GIT_EMAIL"

echo ':small_blue_diamond: Clonning repository' | gum format -t emoji
rm -rf ~/.local/share/custom-setup
git clone --quiet https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup

echo ':small_blue_diamond: Starting the process' | gum format -t emoji
source ~/.local/share/custom-setup/install.sh
