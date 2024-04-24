# header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinks/fast-marching-method
    REF b20f0b224b97935e07bd0ba888c2611ba2786f76
    SHA512 88e48510b762d65491c49e6d7dc18a230bb73bde571823d0ad43c0dff8d074b6fa82b39906d26f0c34a116ee53342d792ad9a75b45579cd9ca9ca4c25d2be68c
    HEAD_REF master
)

file(GLOB FMM_INCLUDE_FILES "${SOURCE_PATH}/include/thinks/fast_marching_method/*.hpp")
file(COPY ${FMM_INCLUDE_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include/thinks/fast_marching_method/")
