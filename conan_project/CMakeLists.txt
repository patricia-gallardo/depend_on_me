cmake_minimum_required(VERSION 3.19.2)

project(depend_on_me_conan
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(setup_conan.cmake)

add_subdirectory(src)
add_subdirectory(test)
