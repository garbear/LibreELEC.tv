# Enable strict shell mode
set -o errexit
set -o nounset
set -o pipefail

PROJECT=Generic DEVICE=Generic ARCH=x86_64 CUSTOM_VERSION=retroplayer-20230907-8fb5abcc make image
PROJECT=RPi ARCH=arm DEVICE=RPi2 CUSTOM_VERSION=retroplayer-20230907-8fb5abcc make image
PROJECT=RPi ARCH=arm DEVICE=RPi4 CUSTOM_VERSION=retroplayer-20230907-8fb5abcc make image
PROJECT=Rockchip ARCH=arm DEVICE=RK3399 CUSTOM_VERSION=retroplayer-20230907-8fb5abcc make image
