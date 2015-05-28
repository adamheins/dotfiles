#!/bin/bash

# Install and configure tmux.
cd $(dirname $0)
sudo apt-get install tmux
cp .tmux.conf ~/.tmux.conf
