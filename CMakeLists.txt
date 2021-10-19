cmake_minimum_required(VERSION 3.19.2)

project(depend_on_me
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

include(ExternalProject)
function(add_sub_project sub_directory)
    ExternalProject_Add(${sub_directory}
            PREFIX ${sub_directory}
            SOURCE_DIR ${CMAKE_SOURCE_DIR}/${sub_directory}
            BINARY_DIR ${sub_directory}
            CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
            INSTALL_COMMAND ""
            )
endfunction()

if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    add_sub_project(conan_project)
endif ()
#add_sub_project(conda_project) # Should be driven from CMake but isn't right now
add_sub_project(cpm_project)
#add_sub_project(external_project) # Not sure what is going wrong here
add_sub_project(fetch_content_project)
add_sub_project(hunter_project)
add_sub_project(vcpkg_project)
