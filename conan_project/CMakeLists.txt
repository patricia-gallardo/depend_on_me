cmake_minimum_required(VERSION 3.19.2)

project(depend_on_me_conan
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(ENV{CONAN_SYSREQUIRES_MODE} enabled)

if (NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.16.1/conan.cmake"
            "${CMAKE_BINARY_DIR}/conan.cmake")
endif ()

include(${CMAKE_BINARY_DIR}/conan.cmake)
conan_check(REQUIRED)
conan_cmake_autodetect(settings)
conan_cmake_install(PATH_OR_REFERENCE ${CMAKE_CURRENT_SOURCE_DIR}/conanfile.txt BUILD missing SETTINGS ${settings})

set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})
message(STATUS "CMAKE_MODULE_PATH  is ${CMAKE_MODULE_PATH}")

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
