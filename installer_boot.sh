set -e

ascii_art='┏┓           ┏┓
┃ ┓┏┏╋┏┓┏┳┓  ┗┓┏┓╋┓┏┏┓
┗┛┗┻┛┗┗┛┛┗┗  ┗┛┗ ┗┗┻┣┛
                    ┛ '

echo -e "$ascii_art"
echo "=> Custom Setup is for fresh Ubuntu 24.04 installations only!"
echo -e "\n\n🔹 Begin installation (or abort with ctrl+c)..."

sleep 5

echo -e "\n\n🔸 Installing OS-related tools..."
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "\n\n🔸 Cloning Custom Setup..."
rm -rf ~/.local/share/custom-setup
git clone https://github.com/AlcidesRC/custom-setup.git ~/.local/share/custom-setup >/dev/null
if [[ $CUSTOM_SETUP_REF != "main" ]]; then
	cd ~/.local/share/custom-setup
	git fetch origin "${CUSTOM_SETUP_REF:-stable}" && git checkout "${CUSTOM_SETUP_REF:-stable}"
	cd -
fi

echo -e "\n\n🔸 Installation starting..."
source ~/.local/share/custom-setup/install.sh