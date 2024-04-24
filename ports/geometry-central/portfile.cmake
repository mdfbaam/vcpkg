vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nmwsharp/geometry-central
    REF "ca6ca18b4f761d69f60ba33aa5f869269cf97e3f"
    SHA512 962e6325bb4002034b0021190d6238878d4e27edf061c19d4db228f80faef5b762064f8f8d53f11d9558529b71a803195157c3746155349991d430350ed46e45
    HEAD_REF master
    PATCHES
        001-disable-symlink.patch
)

vcpkg_from_github(
    OUT_SOURCE_PATH HAPPLY_SOURCE_PATH
    REPO nmwsharp/happly
    REF "88f79725d32d78e0e637ebf42d8432d519e1c7d0"
    SHA512 79f2be2d4f5583bc4ea63d92af142fc1a59c91610dee5d2bbbd3fbfb6ff6cd697cd6cc6d740ac3878278257f550c739832b2ecf10887b0607045e9f09a35c92c
    HEAD_REF master
)

message(STATUS "${HAPPLY_SOURCE_PATH} -> ${SOURCE_PATH}/deps/happly" )

file(COPY "${HAPPLY_SOURCE_PATH}/" DESTINATION "${SOURCE_PATH}/deps/happly")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_SHARED_LIBS=ON
        -DSUITESPARSE=OFF
)
vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
