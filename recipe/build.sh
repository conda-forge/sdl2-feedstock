#!/bin/bash

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

# we have to do this because most build scripts assume that all sdl modules
# are installed to the same prefix.
sed -i -- "s|@prefix@|${PREFIX}|g" sdl2.pc.in 
sed -i -- "s|@prefix@|${PREFIX}|g" sdl2-config.in

# Build SDL2
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  ./autogen.sh
fi
if [ -z ${OSX_ARCH+x} ]; then
  ./configure --prefix=${PREFIX} --disable-haptic;
else
  ./configure --prefix=${PREFIX} --disable-haptic --without-x LDFLAGS="-framework ForceFeedback";
fi

make install
