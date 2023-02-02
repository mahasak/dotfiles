#!/usr/bin/env bash
source ../utils.sh

#curl -o ~/sdks/flutter-stable.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.7.0-stable.zip

#if [ -d "$HOME/sdks/flutter" ]
#then
#  rm -rf ~/sdks/flutter
#fi

#unzip ~/sdks/flutter-stable.zip
#mv ./flutter ~/sdks/

$(append_to_zshrc 'export PATH="$PATH:$HOME/sdks/flutter/bin"')


