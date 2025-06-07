#!/bin/sh

if [[ ! -d $SDKMAN_DIR ]]; then
  sh sdkman.sh
else
  echo "Installing Sdkman..."
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# http://maven.apache.org
sdk install maven
# https://jbake.org/
sdk install jbake
sdk install gradle
sdk install jreleaser
sdk install mvnd
sdk install jbang
sdk install java 21.0.2-tem
sdk install java 17.0.9-tem
sdk install java 8.0.382-tem
sdk default java 21.0.2-tem
