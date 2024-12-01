set_font() {
    local font_name=$1
    local file_name=$2
    local file_type=$3
    local url=$4

    if ! $(fc-list | grep -i "$font_name" >/dev/null); then
        cd /tmp
        wget -O "$file_name.zip" "$url"
        unzip "$file_name.zip" -d "$file_name"
        cp "$file_name"/*."$file_type" ~/.local/share/fonts
        rm -rf "$file_name.zip" "$file_name"
        fc-cache
        cd -
    fi

    gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
}

echo -e "\n\n"

mkdir -p ~/.local/share/fonts

choice=$(gum choose "Caskaydia Cove" "Fira Mono" "JetBrains Mono" --header "Choose your preferred font")

case $choice in
"Caskaydia Cove")
	set_font "CaskaydiaCove Nerd Font" "CaskaydiaCove" "ttf" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip"
	;;
"Fira Mono")
	set_font "FiraMono Nerd Font" "FiraMono" "otf" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip"
	;;
"JetBrains Mono")
	set_font "JetBrainsMono Nerd Font" "JetBrainsMono" "ttf" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
	;;
esac
