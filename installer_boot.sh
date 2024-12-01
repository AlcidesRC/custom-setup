set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

echo -e "$ascii_art"

cd /tmp
GUM_VERSION="0.14.5" # Use known good version
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y ./gum.deb >/dev/null
rm gum.deb
cd -

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 80 --margin "1 2" --padding "2 4" \
	'Custom Setup' 'is for fresh Ubuntu 24.04 installations only!'

gum spin --spinner dot --title "🔹 Begin installation (or abort with ctrl+c)..." -- sleep 5

echo -e "\n\n🔸 Installing Git tool..."
sudo apt-get update >/dev/null && sudo apt-get install -y git >/dev/null

echo -e "\n\n🔸 Cloning Custom Setup..."
rm -rf ~/.local/share/custom-setup
git clone https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup >/dev/null
if [[ $CUSTOM_SETUP_REF != "main" ]]; then
	cd ~/.local/share/custom-setup
	git fetch origin "${CUSTOM_SETUP_REF:-stable}" && git checkout "${CUSTOM_SETUP_REF:-stable}" >/dev/null
	cd -
fi

echo -e "\n\n🔸 Installation starting..."
source ~/.local/share/custom-setup/install.sh