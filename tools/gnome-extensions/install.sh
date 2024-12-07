sudo apt-get install -y gnome-tweaks >/dev/null
sudo apt-get install -y gnome-shell-extensions >/dev/null

grep -qxF 'places-menu@gnome-shell-extensions.gcampax.github.com' ~/.bash_profile || echo 'gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com' >> ~/.bash_profile
grep -qxF 'system-monitor@gnome-shell-extensions.gcampax.github.com' ~/.bash_profile || echo 'gnome-extensions enable system-monitor@gnome-shell-extensions.gcampax.github.com' >> ~/.bash_profile
