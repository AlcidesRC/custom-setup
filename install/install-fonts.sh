sudo apt update -y && sudo apt install -y unzip

mkdir -p ~/.local/share/fonts

cd /tmp

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
cp FiraCode/*.ttf ~/.local/share/fonts
rm -rf FiraCode.zip FiraCode

fc-cache
cd -