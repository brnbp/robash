#! /bin/bash

###############################################################

printf '\ninstall basic apps\n'
apt-get install -y git curl gnome-tweak-tool htop shutter vim

###############################################################

printf '\ninstall arc-theme\n'

# remove old versions
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
apt-key add - < Release.key
rm Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
apt-get update
apt-get install -y arc-theme

###############################################################

printf '\ninstall zsh\n'
apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

###############################################################

printf '\ninstall super flat remix (icons) \n'
cd ~/
mkdir .icons
cd Downloads
git clone https://github.com/daniruiz/Super-Flat-Remix.git
cp -r ~/Downloads/Super-Flat-Remix/Super\ Flat\ Remix ~/.icons
rm -rf ~/Downloads/Super-Flat-Remix
printf "Select ‘Super Flat Remix’ as icons on your system configuration."

###############################################################

printf '\ninstall spotify \n'
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client -y --allow-unauthenticated

###############################################################

printf '\ninstall nodejs\n'
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

###############################################################

printf '\ninstall mongodb\n'
apt-get install -y mongodb
mkdir /data
cd /data
mkdir db
chmod 755 -R /data

###############################################################

printf '\nCopy personal files..\n'
rm -rf ~/.ssh
rm ~/.zshrc
rm ~/.vimrc
cp -r ~/linux-setup/home_dot_files/.* ~/
source ~/.zshrc
source ~/.vimrc

###############################################################

printf '\ninstall php + composer\n'
apt-get install -y php-fpm
curl -sS https://getcomposer.org/installer | php 
mv composer.phar /usr/bin/composer

###############################################################

printf '\ninstall mongo-hacker\n'
git clone https://github.com/TylerBrock/mongo-hacker.git	
make install
cd mongo-hacker
cd ..
rm -rf mongo-hacker

###############################################################

printf '\ninstall aws elastic beanstalk cli\n'
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install awsebcli
rm -rf get-pip.py

###############################################################

printf '\ninstall PhpStorm\n'
cp -r ~/linux-setup/programs/phpstorm/ /opt/phpstorm
ln -s /opt/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm

###############################################################

printf '\ninstall chrome\n'
dpkg -i ~/linux-setup/programs/chrome.deb

###############################################################

printf '\ninstall sublime\n'
dpkg -i ~/linux-setup/programs/sublime.deb

###############################################################

printf '\nCopy desktop icons..\n'
cp ~/linux-setup/desktop-icons/* /usr/share/applications/

###############################################################

printf '\nEverything done. \n'
printf "\nbut wait, don't forget to install postman:\n"
printf 'https://www.getpostman.com/ \n'

printf '\nand install gnome-shell alt tab workspace:\n'
printf 'https://extensions.gnome.org/extension/310/alt-tab-workspace/ \n'









