ROOT="$(pwd)"

source var.sh

# build()
#
# Build the project.
function build() {
  cd Pinetime/build
    make -j 2
  cd $ROOT
}

# clean()
#
# Clean the build and setup.
function clean() {
  cd Pinetime
    rm -rf build
    mkdir build
    cd build
    cmake                                      \
      -DCMAKE_BUILD_TYPE=Release               \
      -DARM_NONE_EABI_TOOLCHAIN_PATH=$LOC_COMP \
      -DNRF5_SDK_PATH=$LOC_SDK                 \
      -DUSE_GDB_CLIENT=0                       \
      -DUSE_JLINK=0                            \
      -DUSE_OPENOCD=0                          \
      ../
  cd $ROOT
}

# help()
#
# Display the help for this script.
function help() {
  echo "bash build.sh <CMD>"
  echo ""
  echo "  ComManD"
  echo ""
  echo "    build  Make the project"
  echo "    clean  Clean the build files"
  echo "    help   Display this help"
}

# main()
#
# Run the main script.
#
# $1 The command to be run.
function main() {
  case $1 in
    build)
      build
      ;;
    clean)
      clean
      ;;
    help)
      help
      ;;
    *)
      help
      ;;
  esac
}

main $@
