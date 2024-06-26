vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jasper-software/jasper
    REF "version-${VERSION}"
    SHA512 31da8f49cec3ba2a3bb9ba40fa54fe64c97d1e564631c980619f0b3ffca36814adc6c2cb8dc1ead774a15546f308e7a33990821538d1e7b6c885b14ed4e1f711
    HEAD_REF master
    PATCHES
        no_stdc_check.patch
        fix-library-name.patch
)

if(VCPKG_TARGET_IS_WINDOWS AND NOT (VCPKG_TARGET_IS_MINGW OR VCPKG_TARGET_IS_LLVM_MINGW))
    set(VCPKG_CXX_FLAGS "/D_CRT_DECLARE_NONSTDC_NAMES ${VCPKG_CXX_FLAGS}")
    set(VCPKG_C_FLAGS "/D_CRT_DECLARE_NONSTDC_NAMES ${VCPKG_C_FLAGS}")
endif()

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" JAS_ENABLE_SHARED)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        opengl    JAS_ENABLE_OPENGL
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DJAS_ENABLE_LIBHEIF=OFF # found via find_library instead of find_package
        -DJAS_ENABLE_LIBJPEG=ON
        -DJAS_ENABLE_DOC=OFF
        -DJAS_ENABLE_LATEX=OFF
        -DJAS_ENABLE_PROGRAMS=OFF
        -DJAS_ENABLE_SHARED=${JAS_ENABLE_SHARED}
    OPTIONS_DEBUG
        -DCMAKE_DEBUG_POSTFIX=d # Due to CMakes FindJasper; Default for multi config generators.
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share")

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
