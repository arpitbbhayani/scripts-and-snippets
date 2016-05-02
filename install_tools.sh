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
        * ) echo "No installation procedure found for $program_name.";;
    esac
}

sudo apt-get update

programs_supported=("vim" "git" "nginx" "java8" "unity-tweak-tool" "royal-theme" "numix-icons")

for program in ${programs_supported[@]}; do
    ask_install $program
done

