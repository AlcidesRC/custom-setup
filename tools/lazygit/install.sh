cd /tmp
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" >/dev/null
tar -xf lazygit.tar.gz lazygit >/dev/null
sudo install lazygit /usr/local/bin >/dev/null
rm lazygit.tar.gz lazygit >/dev/null
cd - >/dev/null
