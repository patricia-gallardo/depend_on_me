cmake_minimum_required(VERSION 3.19.2)

project(depend_on_me_external_project
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14) # SFML uses std::auto_ptr
set(CMAKE_CXX_STANDARD_REQUIRED ON)

cmake_policy(SET CMP0022 NEW)

include(ExternalProject)

set(EXTERNAL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/external)

ExternalProject_Add(external_fmt
        GIT_REPOSITORY https://github.com/fmtlib/fmt.git
        GIT_TAG 8.0.1
        GIT_SHALLOW ON
        CMAKE_ARGS
                ${ADDITIONAL_ARGS}
                -DCMAKE_INSTALL_PREFIX:PATH=${EXTERNAL_PREFIX})

add_library(fmt UNKNOWN IMPORTED)
add_dependencies(fmt external_fmt)
set_target_properties(fmt PROPERTIES
        IMPORTED_LOCATION
                ${EXTERNAL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}fmt${CMAKE_STATIC_LIBRARY_SUFFIX}
        IMPORTED_LOCATION_DEBUG
                ${EXTERNAL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}fmtd${CMAKE_STATIC_LIBRARY_SUFFIX}
)

ExternalProject_Add(Catch2
        DEPENDS fmt
        GIT_REPOSITORY https://github.com/catchorg/Catch2.git
        GIT_TAG v2.13.7
        GIT_SHALLOW ON
        CMAKE_ARGS
                ${ADDITIONAL_ARGS}
                -DCMAKE_INSTALL_PREFIX:PATH=${EXTERNAL_PREFIX})

ExternalProject_Add(external_SFML
        GIT_REPOSITORY https://github.com/SFML/SFML.git
        GIT_TAG 2.5.1
        GIT_SHALLOW ON
        CMAKE_ARGS
                ${ADDITIONAL_ARGS}
                -DCMAKE_INSTALL_PREFIX:PATH=${EXTERNAL_PREFIX})

foreach(LIB sfml-system sfml-audio sfml-window sfml-graphics)
        add_library(${LIB} SHARED IMPORTED)
        add_dependencies(${LIB} external_SFML)
        set_target_properties(${LIB} PROPERTIES
                IMPORTED_LOCATION ${EXTERNAL_PREFIX}/bin/${CMAKE_SHARED_LIBRARY_PREFIX}${LIB}-2${CMAKE_SHARED_LIBRARY_SUFFIX}
                IMPORTED_LOCATION_DEBUG ${EXTERNAL_PREFIX}/bin/${CMAKE_SHARED_LIBRARY_PREFIX}${LIB}-d-2${CMAKE_SHARED_LIBRARY_SUFFIX}
                IMPORTED_IMPLIB ${EXTERNAL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}${LIB}${CMAKE_STATIC_LIBRARY_SUFFIX}
                IMPORTED_IMPLIB_DEBUG ${EXTERNAL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}${LIB}-d${CMAKE_STATIC_LIBRARY_SUFFIX})
endforeach()
        

message(STATUS "CMAKE_MODULE_PATH  is ${CMAKE_MODULE_PATH}")

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
