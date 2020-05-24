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