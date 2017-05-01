#!/bin/bash

set -e
set -x

# Build dependencies
export BOOST_ROOT=$PREFIX
export SNAPPY_HOME=$PREFIX
export THRIFT_HOME=$PREFIX
export ZLIB_HOME=$PREFIX
export BROTLI_HOME=$PREFIX
export PARQUET_ARROW_VERSION=d4a2a75a50cb8ccaddb29bc5462ed3aa34af1d9f

mkdir build-dir
cd build-dir

cmake \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
    -DPARQUET_ARROW=on \
    -DPARQUET_BOOST_USE_SHARED=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DPARQUET_BUILD_EXECUTABLES=off \
    -DPARQUET_ZLIB_VENDORED=off \
    -DPARQUET_BUILD_TESTS=off \
    ..

make -j${CPU_COUNT}
make install
