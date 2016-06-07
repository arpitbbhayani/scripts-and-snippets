ask_install() {
    program_name=$1
    read -p "Do you wish to install $program_name? " yn
    case $yn in
        [Yy]* ) install $program_name;;
        [Nn]* ) echo "Skipping installation for $program_name";;
        * ) echo "Please answer yes or no.";;
    esac
}


setup_git_config() {
    if [ -f .gitconfig ];
    then
        cp .gitconfig ~/.gitconfig
    else
        echo ".gitconfig file does not exist"
    fi
}

download_wallpapers() {
    WALLPAPERS_DIR=~/space_wallpapers
    mkdir -p $WALLPAPERS_DIR

    wget http://www.hdwallpapers.in/download/digital_space_universe_4k_8k-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/northern_lights_iceland_aurora_borealis-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/saturn_dream-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/phoenix_nebula-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/hubble_galaxy-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/asteroid-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/eclipse_galaxy-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/close_planet-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/far_galaxy-1366x768.jpg -O $WALLPAPERS_DIR
    wget http://www.hdwallpapers.in/download/serenity_galaxy-1366x768.jpg -O $WALLPAPERS_DIR
}

install() {
    program_name=$1
    case $program_name in
        vim ) sudo apt-get install -y vim;;
        git ) sudo apt-get install -y git;
              setup_git_config;;
        nginx ) sudo apt-get install -y nginx nginx-extras;;
        java8 ) sudo add-apt-repository ppa:webupd8team/java -y;
                sudo apt-get update;
                sudo apt-get install -y oracle-java8-installer;
                sudo apt-get install -y oracle-java8-set-default;;
        unity-tweak-tool ) sudo apt-add-repository ppa:freyja-dev/unity-tweak-tool-daily;
                           sudo apt-get update;
                           sudo apt-get install unity-tweak-tool;;
        royal-theme ) sudo add-apt-repository ppa:noobslab/themes;
                      sudo apt-get update;
                      sudo apt-get install -y royal-gtk-theme;;
        numix-icons ) sudo add-apt-repository ppa:noobslab/icons;
                      sudo apt-get update;
                      sudo apt-get install vimix-icon-theme;;
        download-wallpapers ) download_wallpapers;;
        mysql-5.7 ) wget http://dev.mysql.com/get/mysql-apt-config_0.3.5-1ubuntu14.04_all.deb;
                    sudo dpkg -i mysql-apt-config_0.3.5-1ubuntu14.04_all.deb;
                    sudo apt-get update;
                    sudo apt-get install mysql-server-5.7 mysql-client-5.7;;
        solarized-theme ) cd $HOME;
                          sudo apt-get install dconf-cli;
                          git clone https://github.com/Anthony25/gnome-terminal-colors-solarized;
                          cd gnome-terminal-colors-solarized;
                          ./install.sh;
                          cd ..;
                          rm -rf gnome-terminal-colors-solarized;;
        * ) echo "No installation procedure found for $program_name.";;
    esac
}

sudo apt-get update

programs_supported=("vim" "git" "nginx" "java8" "unity-tweak-tool" "royal-theme" "numix-icons" "download-wallpapers" "mysql-5.7" "solarized-theme")

for program in ${programs_supported[@]}; do
    ask_install $program
done

