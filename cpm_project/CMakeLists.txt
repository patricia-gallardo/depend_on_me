cmake_minimum_required(VERSION 3.19.2)

project(depend_on_me_cpm
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_definitions(_HAS_AUTO_PTR_ETC=1)

if (NOT EXISTS "${CMAKE_BINARY_DIR}/CPM.cmake")
    message(STATUS "Downloading CPM.cmake from https://github.com/cpm-cmake")
    file(DOWNLOAD "https://github.com/cpm-cmake/CPM.cmake/raw/v0.34.0/cmake/CPM.cmake"
            "${CMAKE_BINARY_DIR}/CPM.cmake")
endif ()

include(${CMAKE_BINARY_DIR}/CPM.cmake)
CPMAddPackage("gh:catchorg/Catch2#v2.13.7")
CPMAddPackage("gh:fmtlib/fmt#8.0.1")
CPMAddPackage("gh:SFML/SFML#2.5.1")

message(STATUS "CMAKE_MODULE_PATH  is ${CMAKE_MODULE_PATH}")

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
