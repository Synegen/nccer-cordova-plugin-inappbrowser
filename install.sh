#!/bin/bash

###
# User: scarlson
# Date: 1/16/2024
##

#
# Node
#

if [ -f $NVM_DIR/nvm.sh ]
then
    printf "\n"
    printf "*** Checking node *** \n\n"

    . $NVM_DIR/nvm.sh

    nvm use >/dev/null 2>&1

    if [ $? -eq 0 ]; then
        printf "*** Node is good! *** \n\n"
    else
        printf "*** Node version not found! Installing... *** \n\n"
        nvm install

        if [ $? -eq 0 ]; then
            printf "\n"
            printf "*** Node installed *** \n\n"
        else
            printf "\n"
            printf "*** Failed to install node version! Aborting... *** \n\n"
            exit 1; # failed to install node
        fi
    fi
else
    printf "\n"
    printf "*** NVM is required but is not installed! *** \n\n"
    printf "For info about NVM: https://github.com/nvm-sh/nvm \n\n"

    read -n 1 -sp "Would you like to install NVM? (Y/n): " installNvmResponse

    if [ "$installNvmResponse" == "" ] || [ "$installNvmResponse" == "Y" ] || [ "$installNvmResponse" == "y" ]; then
        printf "Y \n\n"
        printf "Installing NVM... \n\n"

        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

        printf "\n"
        printf "Once nvm is working, rerun this installation. \n\n"

        exit 1 # nvm was not installed before but now it should be; there may be additional work to make it ready to use, though; read the output
    else
        printf "N \n\n"
        printf "*** NVM is required for almost all of the provided scripts. You are now on your own; good luck! *** \n\n"
        exit 1 # nvm not installed and user chose not to install it
    fi
fi

echo
echo "*** Install node modules..."
echo
npm install

echo install NCCER CraftPRO Cordova InappBrowser Plugin app done
