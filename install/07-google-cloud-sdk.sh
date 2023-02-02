#!/usr/bin/env bash

curl -o ~/sdks/google-cloud-cli.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-415.0.0-darwin-arm.tar.gz
if [ -d "$HOME/sdks/google-cloud-sdk" ]
then
  rm -rf ~/sdks/google-cloud-sdk
fi

tar zxvf ~/sdks/google-cloud-cli.tar.gz -C ~/sdks/
~/sdks/google-cloud-sdk/install.sh
source ~/.zshrc
~/sdks/google-cloud-sdk/bin/gcloud init
rm google-cloud-cli.tar.gz