#! /usr/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

cd $SCRIPT_DIR/src/linux_bindings
arm-linux-gnueabihf-gcc -c -fdump-ada-spec -C $SCRIPT_DIR/sysroot/usr/include/linux/can.h
arm-linux-gnueabihf-gcc -c -fdump-ada-spec -C $SCRIPT_DIR/sysroot/usr/include/linux/can/raw.h
arm-linux-gnueabihf-gcc -c -fdump-ada-spec -C $SCRIPT_DIR/sysroot/usr/include/linux/ioctl.h
arm-linux-gnueabihf-gcc -c -fdump-ada-spec -C $SCRIPT_DIR/sysroot/usr/include/linux/socket.h