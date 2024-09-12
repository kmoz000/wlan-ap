#!/bin/bash

apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y \
            time git-core build-essential gcc-multilib clang \
            libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python \
            python3 python3-pip python3-yaml libssl-dev rsync \
    && apt-get clean
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
pip3 install kconfiglib
