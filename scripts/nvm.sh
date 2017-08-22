#!/usr/bin/env bash

export NVM_DIR="/root/.nvm"

echo https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh

curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
source $NVM_DIR/nvm.sh

echo "export NVM_DIR=${NVM_DIR}" >> $HOME/.bashrc
echo 'source $NVM_DIR/nvm.sh' >> $HOME/.bashrc