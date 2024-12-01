cd /tmp
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz" >/dev/null
tar -xf lazydocker.tar.gz lazydocker >/dev/null
sudo install lazydocker /usr/local/bin >/dev/null
rm lazydocker.tar.gz lazydocker >/dev/null
cd -
