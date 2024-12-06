set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

clear

echo -e "$ascii_art"

#---

# Update and upgrade the OS
sudo apt-get update >/dev/null
sudo apt-get upgrade -y >/dev/null

#---

echo ''
echo ':small_orange_diamond: {{ Color "011" "Preparing the installation" }}' | gum format -t template | gum format -t emoji
echo ''

#---

sudo apt-get install -y curl >/dev/null
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list >/dev/null
sudo apt-get update >/dev/null && sudo apt-get install -y gum >/dev/null

#---

echo ''
echo ':small_red_triangle: {{ Bold "Custom Setup" }} {{ Color "202" "is for fresh Ubuntu 24.04 installations only!" }}' | gum format -t template | gum format -t emoji
echo ''

gum spin --spinner.foreground="202" --spinner minidot --title "Press Ctrl+c to abort" -- sleep 5

#---

echo ':small_orange_diamond: {{ Color "011" "Installing Git..." }}' | gum format -t template | gum format -t emoji
echo ''

sudo apt-get install -y git >/dev/null

GIT_USERNAME=$(gum input --placeholder "What is your preferred user name for Git?")
git config --global user.name "$GIT_USERNAME"

GIT_EMAIL=$(gum input --placeholder "What is your preferred email address for Git?")
git config --global user.email "$GIT_EMAIL"

#---

echo ':small_orange_diamond: {{ Color "011" "Cloning repository..." }}' | gum format -t template | gum format -t emoji
echo ''

rm -rf ~/.local/share/custom-setup
git clone --quiet https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup

#---

source ~/.local/share/custom-setup/install.sh
