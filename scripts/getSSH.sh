#!/bin/bash

ssh-keygen -t ed25519
pbcopy < ~/.ssh/id_ed25519.pub
echo "Copy key to GitHub and press SPACE"
read -r -s -d ' '
