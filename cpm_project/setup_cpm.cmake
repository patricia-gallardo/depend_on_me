if (NOT EXISTS "${CMAKE_BINARY_DIR}/CPM.cmake")
    file(DOWNLOAD
         "https://github.com/cpm-cmake/CPM.cmake/raw/v0.34.0/cmake/CPM.cmake"
         "${CMAKE_BINARY_DIR}/CPM.cmake")
endif ()

# Note: when you shadow a function, the previous definition
# is still available by prefixing with an underscore

# Idea from C++Now2017: Daniel Pfeifer "Effective CMake"
# https://youtu.be/bsXLMQ6WgIk?t=3159
# Note: there appears to be a typo in the presentation slides.
# We need to check ${ARGV0}, not ${ARG0}.
macro(find_package)
        if(NOT "${ARGV0}" IN_LIST CPM_PACKAGES)
                _find_package(${ARGV})
        else()
                message(DEBUG "${ARGV0} already added by CPM")
        endif()
endmacro()

include(${CMAKE_BINARY_DIR}/CPM.cmake)
CPMAddPackage("gh:catchorg/Catch2#v2.13.7")
CPMAddPackage("gh:fmtlib/fmt#8.0.1")
CPMAddPackage("gh:SFML/SFML#2.5.1")
