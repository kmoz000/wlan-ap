FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y \
            time git-core build-essential gcc-multilib g++ fastjar clang \
            libncurses5-dev zlib1g-dev gawk flex gettext wget file unzip python ccache \
            python3 python3-pip xsltproc time python3-yaml swig libssl-dev rsync subversion libelf-dev \
    && apt-get clean
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"
RUN pip3 install kconfiglib
