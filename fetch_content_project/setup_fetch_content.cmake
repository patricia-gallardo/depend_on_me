include(FetchContent)

# A hack that lets FetchContent cooperate with find_package
set(HANDLED_BY_FETCH_CONTENT "") # a list of packages for find_package to ignore

# Note: when you shadow a function, the previous definition
# is still available by prefixing with an underscore

# Idea from C++Now2017: Daniel Pfeifer "Effective CMake"
# https://youtu.be/bsXLMQ6WgIk?t=3159
# Note: there appears to be a typo in the presentation slides.
# We need to check ${ARGV0}, not ${ARG0}.
macro(find_package)
        if(NOT "${ARGV0}" IN_LIST HANDLED_BY_FETCH_CONTENT)
                _find_package(${ARGV})
        else()
                message(DEBUG "${ARGV0} already fetched")
        endif()
endmacro()

macro(FetchContent_MakeAvailable)
        list(APPEND HANDLED_BY_FETCH_CONTENT ${ARGV0})
        _FetchContent_MakeAvailable(${ARGV})
endmacro()

FetchContent_Declare(Catch2
        GIT_REPOSITORY https://github.com/catchorg/Catch2.git
        GIT_TAG        v2.13.7)
FetchContent_MakeAvailable(Catch2)

FetchContent_Declare(fmt
        GIT_REPOSITORY https://github.com/fmtlib/fmt.git
        GIT_TAG 8.0.1)
FetchContent_MakeAvailable(fmt)

FetchContent_Declare(SFML
        GIT_REPOSITORY https://github.com/SFML/SFML.git
        GIT_TAG 2.5.1)
FetchContent_MakeAvailable(SFML)
