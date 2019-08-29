include(${CMAKE_TRIPLET_FILE})
if (DEFINED VCPKG_ENV_OVERRIDES_FILE)
    include(${VCPKG_ENV_OVERRIDES_FILE})
endif()

# GUID used as a flag - "cut here line"
message("c35112b6-d1ba-415b-aa5d-81de856ef8eb")
message("VCPKG_TARGET_ARCHITECTURE=${VCPKG_TARGET_ARCHITECTURE}")
message("VCPKG_CMAKE_SYSTEM_NAME=${VCPKG_CMAKE_SYSTEM_NAME}")
message("VCPKG_CMAKE_SYSTEM_VERSION=${VCPKG_CMAKE_SYSTEM_VERSION}")
message("VCPKG_PLATFORM_TOOLSET=${VCPKG_PLATFORM_TOOLSET}")
message("VCPKG_VISUAL_STUDIO_PATH=${VCPKG_VISUAL_STUDIO_PATH}")
message("VCPKG_CHAINLOAD_TOOLCHAIN_FILE=${VCPKG_CHAINLOAD_TOOLCHAIN_FILE}")
message("VCPKG_BUILD_TYPE=${VCPKG_BUILD_TYPE}")
message("VCPKG_ENV_PASSTHROUGH=${VCPKG_ENV_PASSTHROUGH}")
message("VCPKG_PUBLIC_ABI_OVERRIDE=${VCPKG_PUBLIC_ABI_OVERRIDE}")
