echo ''
gum log --structured --level info "Installing fonts..."
echo ''

set_font() {
    local font_name=$1
    local file_name=$2
    local file_type=$3
    local url=$4

    echo ':small_blue_diamond: {{ Color "014" "Installing '"$font_name"'..." }}' | gum format -t template | gum format -t emoji

    if ! $(fc-list | grep -i "$font_name" >/dev/null); then
        cd /tmp
        wget -qO "$file_name.zip" "$url"
        unzip "$file_name.zip" -d "$file_name"
        cp "$file_name"/*."$file_type" ~/.local/share/fonts
        rm -rf "$file_name.zip" "$file_name"
        fc-cache
        cd -
    fi

    gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
}

mkdir -p ~/.local/share/fonts

fonts=$(gum choose --no-limit "CaskaydiaCove" "FiraMono" "JetBrainsMono" --header "Choose your preferred font...")

for font in $fonts
do
  case $font in
  "CaskaydiaCove")
    set_font "CaskaydiaCove Nerd Font" "CaskaydiaCove" "ttf" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip"
    ;;
  "FiraMono")
    set_font "FiraMono Nerd Font" "FiraMono" "otf" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip"
    ;;
  "JetBrainsMono")
    set_font "JetBrainsMono Nerd Font" "JetBrainsMono" "ttf" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    ;;
  esac
done

echo ''
