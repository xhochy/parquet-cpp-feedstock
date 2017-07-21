#!/bin/bash

set -e
set -x

export PARQUET_BUILD_TOOLCHAIN=$PREFIX
export PARQUET_ARROW_VERSION=362e754b395787fd935d0b66a0cdcbec8aa13f85

mkdir build-dir
cd build-dir

cmake \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
    -DPARQUET_BOOST_USE_SHARED=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DPARQUET_BUILD_EXECUTABLES=off \
    -DPARQUET_BUILD_TESTS=off \
    ..

make -j${CPU_COUNT}
make install
