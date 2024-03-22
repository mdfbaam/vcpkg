set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)

set(VCPKG_ENV_PASSTHROUGH_UNTRACKED PATH)
set(VCPKG_DISABLE_COMPILER_TRACKING ON)

get_filename_component(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/../../scripts/toolchains/llvm-mingw.cmake" ABSOLUTE)

set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

# This is a workaround for boost, its cmake config can't find the compiler without specifying the version
set(VCPKG_LLVM_MINGW_TOOLCHAIN_VERSION 18)

# Since we can't set VCPKG_CMAKE_SYSTEM_NAME (vcpkg binary has a list with acceptable values), we need to set the platform flags manually
set(VCPKG_TARGET_IS_WINDOWS ON)
set(VCPKG_TARGET_IS_LLVM_MINGW ON)
