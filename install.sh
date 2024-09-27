#!/bin/bash

function install_packages() {
    if which apt &> /dev/null; then
        sudo apt update
        for package in "${apt_packages[@]}"; do
            if dpkg -s $package >/dev/null 2>&1; then
                echo -e "\033[32m$package is already installed. Skipping...\033[0m"
            else
                sudo apt install -y $package
            fi
        done
    elif which pacman &> /dev/null; then
        sudo pacman -Syu
        for package in "${pacman_packages[@]}"; do
            if pacman -Qi $package >/dev/null 2>&1; then
                echo -e "\033[32m$package is already installed. Skipping...\033[0m"
            else
                sudo pacman -S $package
            fi
        done
    else
        echo "No supported package manager found. Exiting..."
        exit 1
    fi
}

install_zsh() {
    if [ ! -d ~/.oh-my-zsh ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
    fi

    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi

    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    cargo install eza
    cp ./home/zshrc ~/.zshrc
    echo -e "\033[32m zsh installed"
}

install_keyd() {
  if command -v keyd >/dev/null 2>&1; then
    echo -e "\033[32m keyd exists, skipping..."
    # 在这里添加要执行的命令
  else
    # 在这里添加跳过时要执行的命令或不执行任何操作
    git clone https://github.com/rvaiya/keyd
    cd keyd
    make && sudo make install

    # 添加 /etc/keyd/default.conf 文件
    sudo tee /etc/keyd/default.conf > /dev/null <<EOT
[ids]
*

[main]
# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
esc = capslock
EOT

    	# 添加开机自启
    	sudo systemctl enable keyd && sudo systemctl start keyd
    fi
}

function install_dotfile() {
    echo -e "\033[32m Installing dotfiles..."
    cp config/* ~/.config/ -r
    echo -e "\033[32m Dotfiles installed successfully."
}

install_v2raya ()
{
  # install v2ray-core
  if [ -e /usr/share/applications/v2raya.desktop ]; then
  	echo -e "\033[32m v2flya exists, executing..."
  else
   git clone https://github.com/v2fly/fhs-install-v2ray
   chmod +x fhs-install-v2ray/install-release.sh 
   sudo ./fhs-install-v2ray/install-release.sh 

   # install v2raya 
   wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/v2raya.asc   #添加公钥
   echo "deb https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list    #添加v2rayA软件源
   sudo apt update
   sudo apt install v2raya 
   sudo systemctl start v2raya.service
  fi
}

install_npx(){
  # installs nvm (Node Version Manager)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

  # download and install Node.js (you may need to restart the terminal)
  nvm install 20

  # verifies the right Node.js version is in the environment
  node -v # should print `v20.17.0`

  # verifies the right npm version is in the environment
  npm -v # should print `10.8.2`
}


install_Tools(){

  flatpak install flathub md.obsidian.Obsidian 
  flatpak install flathub org.telegram.desktop
}

# List of packages to install using apt
apt_packages=(ranger tmux kitty zsh gcc 
	clangd cmake make wget curl git gdb cargo
	gnome-tweaks gnome-shell-extensions  )

# List of packages to install using pacman
pacman_packages=(zsh gcc clang cmake make wget curl git)

# Call the function to install packages
install_packages
install_zsh
install_keyd
install_dotfile
install_v2raya
