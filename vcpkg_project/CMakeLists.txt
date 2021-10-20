cmake_minimum_required(VERSION 3.19.2)

include(setup_vcpkg.cmake)

project(depend_on_me_vcpkg
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS "CMAKE_MODULE_PATH  is ${CMAKE_MODULE_PATH}")

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
