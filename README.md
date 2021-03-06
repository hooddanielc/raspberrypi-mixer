raspberrypi4-mixer
==================

This repo contains configs And utilities for building a raspberry pi 4 operating system
image that can be installed on an SD card. Project will build ardour6 and
calf studio tools. This project based on Yocto Project using
[OpenEmbedded](https://www.openembedded.org/wiki/Main_Page) build framework.
If you intend to use this project for older or newer raspberry pi hardware,
you may want to update or downgrade submodules by checking out branch by
[codename](https://wiki.yoctoproject.org/wiki/Releases). More information provided
at [yoctoproject](https://www.yoctoproject.org/).

# dependencies

- __docker__ - so you can build in any 64bit environment
# Building Images with Yocto


# project directories

- __docker__: container for running a build.
- __build__: build config for building mixer
- __tools__:
    - poky: openembedded build system (bitbake and openembedded core)
- __layers__: thirdparty openembedded layers
    - __meta-96boards__: git://github.com/96boards/meta-96boards
    - __meta-intel-realsense__: git@github.com:IntelRealSense/meta-intel-realsense.git
    - __meta-musicians__: git@github.com:schnitzeltony/meta-musicians.git
    - __meta-openembedded__: git://git.openembedded.org/meta-openembedded
    - __meta-qt5__: git://github.com/meta-qt5/meta-qt5.git
    - __meta-raspberrypi__: git://git.yoctoproject.org/meta-raspberrypi

# build

This configuration only works for raspbery pi 4

```
./docker/run.sh
# inside the container run
source tools/poky/oe-init-build-env build
bitbake core-image-sato
```

# deploy to raspberry pi

install and use [bmap tools](git@github.com:intel/bmap-tools.git) to write image to raspberry pi. Make sure you specify the correct hard drive. Here I am using /dev/sdd
which is my sd card connected to my computer.

```
sudo bmaptool copy build/tmp/deploy/images/raspberrypi4-64/core-image-sato-raspberrypi4-64.wic.bz2 /dev/sdd
```
