#!/bin/bash

# QEMU
export QEMU=~/pebble/qemu-dev/

# JIRA tool
export JIRA_URL="https://pebbletechnology.atlassian.net"
export JIRA_PREFIX="PBL-"

# Pebble SDK
export PATH=~/dev/pebble/PebbleSDK-3.6-dp1/bin:$PATH
export PEBBLE_SDK_PATH=~/dev/pebble/PebbleSDK-3.6-dp1

# Test Automation
export PATH=~/dev/pebble/pebblesdk-test:~/dev/pebble/pebblesdk-test/scripts:$PATH
export TINTIN_ROOT=~/dev/pebble/tintin
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH=~/pebble-test/bin:~/pebble-test/bin/wrapper:$PATH

# Autocompletion for waf
source ~/.waf_complete/waf_complete.sh

# Enable mac bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
