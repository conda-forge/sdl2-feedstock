#!/bin/bash
set -ex

cd cmake_test

cmake -G "Ninja" \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_PREFIX_PATH="$PREFIX" \
    -DCMAKE_MODULE_PATH="$PREFIX/lib/cmake" \
    .

cmake --build .

./test_me
