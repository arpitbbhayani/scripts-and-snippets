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
        java8 ) sudo add-apt-repository ppa:webupd8team/java -y;
                sudo apt-get update;
                sudo apt-get install -y oracle-java8-installer;
                sudo apt-get install -y oracle-java8-set-default;;
        python-dev ) sudo apt-get install virtualenvwrapper python-pip python3-pip;
                     sudo apt-get install python-dev python3-dev;
                     echo "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh" >> ~/.bashrc;;
        unity-tweak-tool ) sudo apt-add-repository ppa:freyja-dev/unity-tweak-tool-daily;
                           sudo apt-get update;
                           sudo apt-get install unity-tweak-tool;;
        zsh ) sudo apt-get install zsh;
              sudo apt-get install git-core;
              wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;
              chsh -s `which zsh`;;
        atom ) sudo add-apt-repository ppa:webupd8team/atom;
               sudo apt-get update;
               sudo apt-get install atom;;
        tibesta) sudo add-apt-repository ppa:ackondro/tibesti;
                 sudo apt-get update;
                 sudo apt-get install tibesti;
        * ) echo "No installation procedure found for $program_name.";;
    esac
}

# sudo apt-get update

programs_supported=("vim" "git" "java8" "unity-tweak-tool" "zsh" "python-dev" "atom" "tibesta")

for program in ${programs_supported[@]}; do
    ask_install $program
done

