include(FetchContent)
FetchContent_Declare(
        vcpkg
        GIT_REPOSITORY https://github.com/microsoft/vcpkg
        GIT_TAG master
)

if (NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    FetchContent_GetProperties(vcpkg
            POPULATED vcpkg_POPULATED
            SOURCE_DIR vcpkg_SOURCE_DIR)
    if (NOT vcpkg_POPULATED)
        FetchContent_Populate(vcpkg)
    endif ()

    set(CMAKE_TOOLCHAIN_FILE
            "${vcpkg_SOURCE_DIR}/scripts/buildsystems/vcpkg.cmake")
    #    set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE
    #            "${CMAKE_CURRENT_LIST_DIR}/../common/cmake/toolchain.cmake")
endif ()
