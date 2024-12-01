set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

echo -e "$ascii_art"
echo "=> Custom Setup is for fresh Ubuntu 24.04 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Custom Setup..."
rm -rf ~/.local/share/custom-setup
git clone https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup >/dev/null
if [[ $CUSTOM_SETUP_REF != "main" ]]; then
	cd ~/.local/share/custom-setup
	git fetch origin "${CUSTOM_SETUP_REF:-stable}" && git checkout "${CUSTOM_SETUP_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/custom-setup/install.sh