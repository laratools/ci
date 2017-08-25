#!/usr/bin/env bash

printf "Checking PHP\n"
php --version

printf "\n\nChecking Composer\n"
composer --version

printf "\n\nChecking NVM\n"
source ~/.nvm/nvm.sh
nvm --version