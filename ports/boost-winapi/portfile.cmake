# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/winapi
    REF boost-1.76.0
    SHA512 f16965928f0781123a17d13b0f73b1af33d22baa412f87acf4355c6f110318f424b535a559d366d61b111ed1f9eda9140e7cc357f50936e0f8049e1fd44bbe47
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
