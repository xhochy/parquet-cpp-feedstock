set PARQUET_BUILD_TOOLCHAIN=%LIBRARY_PREFIX%
set PARQUET_ARROW_VERSION=46315431aeda3b6968b3ac4c1087f6d41052b99d

REM Set short build path to not overcome max obj files path length of 150 characters on Windows
mkdir C:\bld\build
pushd C:\bld\build

cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE=Release ^
                             -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
                             -DPARQUET_BOOST_USE_SHARED=OFF ^
                             -DPARQUET_BUILD_TESTS=OFF ^
                             -DPARQUET_ZLIB_VENDORED=OFF ^
                             "%SRC_DIR%"

cmake --build . --target install --config Release

popd
