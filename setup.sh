#!/bin/bash

COMP_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2?revision=05382cca-1721-44e1-ae19-1e7c3dc96118&la=en&hash=D7C9D18FCA2DD9F894FD9F3C3DC9228498FA281A"
COMP_FILE="gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2"
COMP_DIR="gcc-arm-none-eabi-9-2020-q2-update"

SDK_URL="https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip"
SDK_FILE="nRF5_SDK_15.3.0_59ac345.zip"
SDK_DIR="nRF5_SDK_15.3.0_59ac345"

# Update variables
sudo apt-get update
sudo apt-get -y upgrade

# Install required programs
sudo apt-get -y install \
  cmake                 \
  git                   \
  wget                  \
  vim

# Remove unwanted package manger files
sudo apt-get -y autoclean
sudo apt-get -y autoremove

# Grab compiler if needed
if [ -f "$COMP_FILE" ]; then
  echo "$COMP_FILE exists, skipping"
else
  echo "$COMP_FILE does not exist, downloading"
  wget -O "$COMP_FILE" "$COMP_URL"
fi

# Grab SDK if needed
if [ -f "$SDK_FILE" ]; then
  echo "$SDK_FILE exists, skipping"
else
  echo "$SDK_FILE does not exist, downloading"
  wget -O "$SDK_FILE" "$SDK_URL"
  unzip "$SDK_FILE"
fi

# Produce script with variables
rm var.sh
echo "#!/bin/bash"               >> var.sh
echo "LOC_COMP=$(pwd)/$COMP_DIR" >> var.sh
echo "LOC_SDK=$(pwd)/$SDK_DIR"   >> var.sh
