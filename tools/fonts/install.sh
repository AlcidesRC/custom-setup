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
        clear
    fi

    gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
}

mkdir -p ~/.local/share/fonts

choice=$(gum choose "Fira Mono" "Caskaydia Mono" "JetBrains Mono" --header "Choose your preferred programming font")

case $choice in
"Fira Mono")
	set_font "FiraMono Nerd Font" "FiraMono" "otf" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip"
	;;
"Caskaydia Mono")
	set_font "CaskaydiaMono Nerd Font" "CaskaydiaMono" "ttf" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaMono.zip"
	;;
"JetBrains Mono")
	set_font "JetBrainsMono Nerd Font" "JetBrainsMono" "ttf" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
	;;
esac
