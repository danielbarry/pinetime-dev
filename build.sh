ROOT="$(pwd)"

source var.sh

cd Pinetime
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DARM_NONE_EABI_TOOLCHAIN_PATH=$LOC_COMP -DNRF5_SDK_PATH=$LOC_SDK ../
cd $ROOT
