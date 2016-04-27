ask_install() {
    program_name=$1
    read -p "Do you wish to install $program_name? " yn
    case $yn in
        [Yy]* ) install $program_name;;
        [Nn]* ) echo "Skipping installation for $program_name";;
        * ) echo "Please answer yes or no.";;
    esac
}


install() {
    program_name=$1
    case $program_name in
        git ) sudo apt-get install git;;
        nginx ) sudo apt-get install -y nginx nginx-extras;;
        java8 ) sudo add-apt-repository ppa:webupd8team/java -y;
                sudo apt-get update;
                sudo apt-get install -y oracle-java8-installer;
                sudo apt-get install -y oracle-java8-set-default;;
        * ) echo "No installation procedure found for $program_name.";;
    esac
}

sudo apt-get update

programs_supported=("git" "nginx", "java8")

for program in ${programs_supported[@]}; do
    ask_install $program
done
