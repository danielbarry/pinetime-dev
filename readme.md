# Getting Started

To follow this setup you will need:

* `git` -- The repository tool
* `vagrant` -- The virtual machine builder
* `virtualbox` -- Runs the virtual machine

Grab the files from the git repository:

    git clone                                  \
      --recurse-submodules --remote-submodules \
      git@github.com:danielbarry/pinetime-dev.git

Setup the virtual machine (this will take a while):

    vagrant up

Login to the virtual machine and build:

    vagrant ssh
    cd dev
    bash build.sh clean
    bash build.sh build
