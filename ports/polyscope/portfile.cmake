vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nmwsharp/polyscope
    REF "v2.2.1"
    SHA512 5c5377d27eab0f9c4b1ffea55bae354abaaa8b0a54115d06896a1e8f677efa1afbc9c4862f033de4dea04a1643be5b895dc5b6ac68888ca7d38a6c1a6b28a2d7
    HEAD_REF master
    PATCHES
        001-find-external-deps.patch
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
        -DPOLYSCOPE_BACKEND_OPENGL3_GLFW=ON
)
vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
