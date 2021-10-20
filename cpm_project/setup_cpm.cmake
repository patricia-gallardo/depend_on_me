if (NOT EXISTS "${CMAKE_BINARY_DIR}/CPM.cmake")
    message(STATUS "Downloading CPM.cmake from https://github.com/cpm-cmake")
    file(DOWNLOAD "https://github.com/cpm-cmake/CPM.cmake/raw/v0.34.0/cmake/CPM.cmake"
            "${CMAKE_BINARY_DIR}/CPM.cmake")
endif ()

include(${CMAKE_BINARY_DIR}/CPM.cmake)
CPMAddPackage("gh:catchorg/Catch2#v2.13.7")
CPMAddPackage("gh:fmtlib/fmt#8.0.1")
CPMAddPackage("gh:SFML/SFML#2.5.1")
