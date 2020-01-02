#!/bin/sh

curl -s "https://get.sdkman.io" | bash

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 8.0.232.hs-adpt
# http://maven.apache.org
sdk install maven
# https://jbake.org/
sdk install jbake