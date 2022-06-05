#!/bin/bash

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-scripts

# we have to do this because most build scripts assume that all sdl modules
# are installed to the same prefix.
sed -i -- "s|@prefix@|${PREFIX}|g" sdl2.pc.in 
sed -i -- "s|@prefix@|${PREFIX}|g" sdl2-config.in

# Build SDL2
./autogen.sh
if [ -z ${OSX_ARCH+x} ]; then
  ./configure --prefix=${PREFIX};
else
  ./configure --prefix=${PREFIX} --without-x LDFLAGS="-framework ForceFeedback";
fi

make install
