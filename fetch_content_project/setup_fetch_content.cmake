include(FetchContent)

set(handled_by_fetch_content "")

FetchContent_Declare(Catch2
        GIT_REPOSITORY https://github.com/catchorg/Catch2.git
        GIT_TAG        v2.13.7)
FetchContent_MakeAvailable(Catch2)
list(APPEND handled_by_fetch_content Catch2)

FetchContent_Declare(fmt
        GIT_REPOSITORY https://github.com/fmtlib/fmt.git
        GIT_TAG 8.0.1)
FetchContent_MakeAvailable(fmt)
list(APPEND handled_by_fetch_content fmt)

FetchContent_Declare(SFML
        GIT_REPOSITORY https://github.com/SFML/SFML.git
        GIT_TAG 2.5.1)
FetchContent_MakeAvailable(SFML)
list(APPEND handled_by_fetch_content SFML)

macro(find_package)
        if(NOT "${ARGV0}" IN_LIST handled_by_fetch_content)
                _find_package(${ARGV})
        else()
                message(DEBUG "${ARGV0} already fetched")
        endif()
endmacro()
