vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY ONLY_DYNAMIC_CRT)

file(GLOB OSG_PLUGINS_SUBDIR ${CURRENT_INSTALLED_DIR}/tools/osg/osgPlugins-*)
list(LENGTH OSG_PLUGINS_SUBDIR OSG_PLUGINS_SUBDIR_LENGTH)
if(NOT OSG_PLUGINS_SUBDIR_LENGTH EQUAL 1)
    message(FATAL_ERROR "Could not determine osg version")
endif()
string(REPLACE "${CURRENT_INSTALLED_DIR}/tools/osg/" "" OSG_PLUGINS_SUBDIR "${OSG_PLUGINS_SUBDIR}")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gwaldron/osgearth
    REF 342fcadf4c8892ba84841cb5b4162bdc51519e3c #version 3.1
    SHA512 03378a918306846d2144e545785c783b01e33fa2dd5c77d16d390a275217b6ce7a3a743c35ae99a497b272a7516b055442c0a891bd312cce727a5538b40364f5
    HEAD_REF master
    PATCHES
        make-all-find-packages-required.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DOSGEARTH_BUILD_EXAMPLES=OFF
        -DOSGEARTH_BUILD_TESTS=OFF
        -DOSGEARTH_BUILD_DOCS=OFF
        -DOSGEARTH_BUILD_PROCEDURAL_NODEKIT=OFF
        -DOSGEARTH_BUILD_TRITON_NODEKIT=OFF
        -DOSGEARTH_BUILD_SILVERLINING_NODEKIT=OFF
        -DWITH_EXTERNAL_TINYXML=ON
)

vcpkg_install_cmake()

#Release
set(OSGEARTH_TOOL_PATH ${CURRENT_PACKAGES_DIR}/tools/${PORT})
set(OSGEARTH_TOOL_PLUGIN_PATH ${OSGEARTH_TOOL_PATH}/${OSG_PLUGINS_SUBDIR})

file(MAKE_DIRECTORY ${OSGEARTH_TOOL_PATH})
file(MAKE_DIRECTORY ${OSGEARTH_TOOL_PLUGIN_PATH})

file(GLOB OSGEARTH_TOOLS ${CURRENT_PACKAGES_DIR}/bin/*.exe)
file(GLOB OSGDB_PLUGINS ${CURRENT_PACKAGES_DIR}/bin/${OSG_PLUGINS_SUBDIR}/osgdb*.dll)

file(COPY ${OSGEARTH_TOOLS} DESTINATION ${OSGEARTH_TOOL_PATH})
file(COPY ${OSGDB_PLUGINS} DESTINATION ${OSGEARTH_TOOL_PLUGIN_PATH})

file(REMOVE_RECURSE ${OSGEARTH_TOOLS})
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin/${OSG_PLUGINS_SUBDIR})

#Debug
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

set(OSGEARTH_DEBUG_TOOL_PATH ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT})
set(OSGEARTH_DEBUG_TOOL_PLUGIN_PATH ${OSGEARTH_DEBUG_TOOL_PATH}/${OSG_PLUGINS_SUBDIR})

file(MAKE_DIRECTORY ${OSGEARTH_DEBUG_TOOL_PATH})
file(MAKE_DIRECTORY ${OSGEARTH_DEBUG_TOOL_PLUGIN_PATH})

file(GLOB OSGEARTH_DEBUG_TOOLS ${CURRENT_PACKAGES_DIR}/debug/bin/*.exe)
file(GLOB OSGDB_DEBUG_PLUGINS ${CURRENT_PACKAGES_DIR}/debug/bin/${OSG_PLUGINS_SUBDIR}/osgdb*.dll)

file(COPY ${OSGEARTH_DEBUG_TOOLS} DESTINATION ${OSGEARTH_DEBUG_TOOL_PATH})
file(COPY ${OSGDB_DEBUG_PLUGINS} DESTINATION ${OSGEARTH_DEBUG_TOOL_PLUGIN_PATH})

file(REMOVE_RECURSE ${OSGEARTH_DEBUG_TOOLS})
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/bin/${OSG_PLUGINS_SUBDIR})

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
