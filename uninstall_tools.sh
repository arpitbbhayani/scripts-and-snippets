ask_uninstall() {
    program_name=$1
    read -p "Do you wish to uninstall $program_name? " yn
    case $yn in
        [Yy]* ) uninstall $program_name;;
        [Nn]* ) echo "Skipping uninstallation for $program_name";;
        * ) echo "Please answer yes or no.";;
    esac
}


uninstall() {
    program_name=$1
    case $program_name in
        libreoffice ) sudo apt-get remove -y --purge libreoffice*;;
        lenses ) sudo apt-get remove -y unity-lens-applications unity-lens-friends unity-lens-photos;;
        * ) echo "No uninstallation procedure found for $program_name.";;
    esac
}

programs_supported=("lenses" "libreoffice")

for program in ${programs_supported[@]}; do
    ask_uninstall $program
done

sudo apt-get clean
sudo apt-get autoremove
