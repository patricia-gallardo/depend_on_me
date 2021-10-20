cmake_minimum_required(VERSION 3.19.2)

project(depend_on_me_cpm
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14) # SFML uses std::auto_ptr
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(setup_cpm.cmake)

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
