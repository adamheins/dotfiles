#!/bin/bash

# Set up the bash and profile configuration.
cd $(dirname $0)
cp .bash_profile ~/.bash_profile
cp .bashrc ~/.bashrc
cp -r .scripts ~/.scripts
. ~/.bash_profile
