#!/bin/bash
rm -rf .git

cp * $HOME

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
